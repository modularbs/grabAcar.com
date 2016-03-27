/// date of birth restricted to 18+.

var today = new Date();
var day = new String(today.getDate());
var mon = new String(today.getMonth() + 1); 
var yr = today.getFullYear() - 18;

if (day.length < 2) { day = "0" + day; }
if (mon.length < 2) { mon = "0" + mon; }

var date = new String(yr + '-' + mon + '-' + day);

$("#DateOfBirth").attr('max', date);