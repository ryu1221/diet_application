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
    showNonCurrentDates: true,
    businessHours: true,
    timeZone: 'Asia/Tokyo',
    headerToolbar: {
      left: 'today',
      center: 'title',
      right: 'prev,next'
    },
    events: '/events.json',
    editable: true,
  });

  calendar.render();
});