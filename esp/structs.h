// Unsigned short for Uptime::id or unsigned char for Startup::reason may suffice, but there will be padding due to
// memory alignment rules. So, let's not waste space. For details see:
// https://stackoverflow.com/questions/119123/why-isnt-sizeof-for-a-struct-equal-to-the-sum-of-sizeof-of-each-member

// Represents uptime duration in the current session. `id` is equal the
// number of device resets, and `millis` is the uptime duration. When the
// device boots, `id` is set to previous id + 1, and `millis` is updated
// with a period given in `config.h`.
struct Uptime
{
  unsigned long id;
  unsigned long millis;
};

// Represents the reason of a device boot. `id` is for the session and
// increased by one everytime the device resets. `reason` indicates the cause
// of a reset whether from `ESP.getResetInfoPtr()` function, or a soft reset
// (which we trigger in the code) reason mentioned in `config.h`.
struct Startup
{
  unsigned short id;
  unsigned short reason;
};

// Represents a scheduled action. For example, a Command instance of
// (2, 15, 30, 2) means that the curtain should be opened on Mondays,
// when the time is 15:30.
struct Command
{
  unsigned char day; // day of the week from 1 to 7, 1 for Sunday
  unsigned char hour;
  unsigned char minute;
  unsigned char action; // 1 for Close, 2 for Open
};