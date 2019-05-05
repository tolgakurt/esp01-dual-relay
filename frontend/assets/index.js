const apis = {
  getSchedule: "https://curtaincontrol.azurewebsites.net/api/getSchedule?code=8VaHbNChRxAWXu3eVhB2QcucMY3YylxfPR2Q4ojjgedsFB42tQecew%3D%3D"
};

window.addEventListener('load', (evt) => {
  console.log('Window is loaded.');

  // Register service worker.
  if ('serviceWorker' in navigator) {
    navigator.serviceWorker
    .register('/service-worker.js')
    .then(() => {
      console.log('Service worker registered.');
    })
    .catch(err => {
      console.error('Service worker registration failed: ' + err);
    });
  }

  // Set items for registered devices and their schedules in the local storage, if not yet.
  if (localStorage.getItem('devices') === null) localStorage.setItem('devices', '{}');
  if (localStorage.getItem('schedules') === null) localStorage.setItem('schedules', '{}');

  // Create a Vue instance for devices.
  const vueApp = new Vue({
    el: '#vueApp',
    data: {
      devices: JSON.parse(localStorage.getItem('devices')),
      schedules: JSON.parse(localStorage.getItem('schedules')),
      newDeviceId: '',
      newDeviceName: ''
    },
    computed: {
      checkDeviceId: function () {
        return this.newDeviceId.trim().length === 0
          || /\s/.test(this.newDeviceId)
          || this.newDeviceName.trim().length === 0;
      }
    },
    methods: {
      addNewDevice: function (event) {
        console.log('Will try to add a new device.');

        const options = {
          method: 'GET',
          headers: {
            Accept: 'application/json'
          }
        };
        fetch(apis.getSchedule + '&deviceId=' + this.newDeviceId, options)
        .then(response => {
          console.log(response);

          response.json()
          .then(json => {
            if (!response.ok) {
              console.log('Response is not ok!');
              alert(json.message);
              return;
            }

            this.$set(this.devices, this.newDeviceId, this.newDeviceName);
            localStorage.setItem('devices', JSON.stringify(this.devices));

            this.$set(this.schedules, this.newDeviceId, json.schedule);
            localStorage.setItem('schedules', JSON.stringify(this.schedules));

            this.newDeviceId = '';
            this.newDeviceName = '';
          });
        })
        .catch(err => {
          console.log('Get schedule equest failed.', err);
        });
      },
      deleteDevice: function (deviceId) {
        console.log(`Will try to delete the device ${deviceId}.`);

        this.$delete(this.devices, deviceId);
        localStorage.setItem('devices', JSON.stringify(this.devices));

        this.$delete(this.schedules, deviceId);
        localStorage.setItem('schedules', JSON.stringify(this.schedules));
      }
    }
  });
});