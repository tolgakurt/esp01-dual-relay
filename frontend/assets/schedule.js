const apis = {
  invokeDeviceMethod: 'https://curtaincontrol.azurewebsites.net/api/invokeDeviceMethod?code=a6RZcfJPohCczGGn1D9LhsoCYK0nTGOwC4BSp5DVjBrI4aTmWeS%2Feg%3D%3D',
  setSchedule: 'https://curtaincontrol.azurewebsites.net/api/setSchedule?code=DUgviF3vV83PZ9pCxd3XA%2FqabItWTUWOlkRL8k%2FJy7amgqmq3Js9rw%3D%3D'
};

// Returns the value of the query variable with the given name.
function getParameterByName(name) {
  const url = window.location.href;
  const regex = new RegExp('[?&]' + name.replace(/[\[\]]/g, '\\$&') + '(=([^&#]*)|&|#|$)');
  const results = regex.exec(url);
  if (!results) return null;
  if (!results[2]) return '';
  return decodeURIComponent(results[2].replace(/\+/g, ' '));
}

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

  // Create a Vue instance for schedule of the current device.
  const deviceId = getParameterByName('deviceId');
  const deviceName = JSON.parse(localStorage.getItem('devices'))[deviceId];
  const schedules = JSON.parse(localStorage.getItem('schedules'));
  const vueApp = new Vue({
    el: '#vueApp',
    data: {
      deviceId: deviceId,
      deviceName: deviceName,
      schedule: [...schedules[deviceId]],
      scheduleDay: null,
      scheduleHour: null,
      scheduleMinute: null,
      scheduleAction: null
    },
    computed: {
      checkScheduleItem: function () {
        return !this.scheduleDay || !this.scheduleHour || !this.scheduleMinute || !this.scheduleAction
          || this.scheduleHour < 0 || this.scheduleHour > 23 || this.scheduleMinute < 0 || this.scheduleMinute > 59
          || !Number.isInteger(parseFloat(this.scheduleHour)) || !Number.isInteger(parseFloat(this.scheduleMinute));
      }
    },
    methods: {
      dayIndexToString: function (dayIndex) {
        switch (dayIndex) {
          case 1: return "Pazar";
          case 2: return "Pazartesi";
          case 3: return "Salı";
          case 4: return "Çarşamba";
          case 5: return "Perşembe";
          case 6: return "Cuma";
          case 7: return "Cumartesi";
          default: return "Tanımsız";
        }
      },
      createFormattedTime: function (hour, minute) {
        return (hour < 10 ? '0' + hour : hour) + ':' + (minute < 10 ? '0' + minute : minute);
      },
      actionIndexToString: function (actionIndex) {
        switch (actionIndex) {
          case 1: return "Kapat";
          case 2: return "Aç";
          default: return "Tanımsız";
        }
      },
      invokeDeviceMethod: function (action) {
        console.log('Will try to add a new device.');

        const options = {
          method: 'POST',
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json'
          },
          body: JSON.stringify({
            deviceId: deviceId,
            action: action
          })
        };
        fetch(apis.invokeDeviceMethod, options)
        .then(response => {
          console.log(response);

          response.json()
          .then(json => {
            console.log(`Received response: ${json}`);

            if (response.ok) {
              console.log('Response is ok!');
            }
            else {
              console.log('Response is not ok!');
            }

            alert(json.message);
          });
        })
        .catch(err => {
          console.log('Cihaz komutu gönderme başarısız.', err);
        });
      },
      setSchedule: function (index) {
        console.log('Will try to schedule device.');

        const newSchedule = schedules[this.deviceId];

        if (index !== undefined) {
          newSchedule.splice(index, 1);
        }
        else {
          if (this.scheduleDay === 'weekDays') {
            [2, 3, 4, 5, 6].forEach(day => {
              newSchedule.push([
                day,
                parseInt(this.scheduleHour, 10),
                parseInt(this.scheduleMinute, 10),
                parseInt(this.scheduleAction, 10)
              ]);
            });
          }
          else if (this.scheduleDay === 'weekEnd') {
            [1, 7].forEach(day => {
              newSchedule.push([
                day,
                parseInt(this.scheduleHour, 10),
                parseInt(this.scheduleMinute, 10),
                parseInt(this.scheduleAction, 10)
              ]);
            });
          }
          else if (this.scheduleDay === 'allDays') {
            [1, 2, 3, 4, 5, 6, 7].forEach(day => {
              newSchedule.push([
                day,
                parseInt(this.scheduleHour, 10),
                parseInt(this.scheduleMinute, 10),
                parseInt(this.scheduleAction, 10)
              ]);
            });
          }
          else {
            newSchedule.push([
              parseInt(this.scheduleDay, 10),
              parseInt(this.scheduleHour, 10),
              parseInt(this.scheduleMinute, 10),
              parseInt(this.scheduleAction, 10)
            ]);
          }
        }

        const options = {
          method: 'POST',
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json'
          },
          body: JSON.stringify({
            deviceId: deviceId,
            schedule: newSchedule
          })
        };
        fetch(apis.setSchedule, options)
        .then(response => {
          console.log(response);

          response.json()
          .then(json => {
            if (response.ok) {
              console.log('Response is ok!');
              this.schedule = [...newSchedule];
              localStorage.setItem('schedules', JSON.stringify(schedules));

              this.scheduleDay = '';
              this.scheduleHour = '';
              this.scheduleMinute = '';
              this.scheduleAction = '';
            }
            else {
              console.log('Response is not ok!');
            }

            alert(json.message);
          });
        })
        .catch(err => {
          console.log('Cihaz komutu gönderme başarısız.', err);
        });
      }
    }
  });
});