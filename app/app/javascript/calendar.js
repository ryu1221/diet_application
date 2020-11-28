import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new Calendar(calendarEl, {
    plugins: [ dayGridPlugin, interactionPlugin],
    selectable: true, 
    navLinks: true,
    locale: 'ja',
    showNonCurrentDates: false,
    headerToolbar: {
      start: '', // will normally be on the left. if RTL, will be on the right
      center: 'title',
      end: 'prev,next' // will normally be on the right. if RTL, will be on the left
    },
  });

  calendar.render();
});