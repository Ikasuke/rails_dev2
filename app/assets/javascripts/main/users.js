// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/


// ページ切り替え時（初回ページも対象）
//$(document).on 'turbolinks:load', ->
$(document).on('turbolinks:load', function(e) {
  $('#calendar').fullCalendar({

      buttonText: {
           today: '本日'
      },
      navLinks: true,
      selectable: true,   //選択可能
      selectHelper: true,   // 選択時にプレースホルダーを描画
      select: function(start, end) {
              var title = prompt('イベントを追加');
              var eventData;
              if (title) {
                eventData = {
                  title: title,
                  start: start,
                  end: end
                };
                $('#calendar').fullCalendar('renderEvent', eventData, true);
              }
             $('#calendar').fullCalendar('unselect');

            },
      events: '/to_do_item/events.json',
      editable: true
   });
  console.log('turbolinks:load');

});

//他ページからブラウザバックなどによって戻ってきた場合、2回描画が行われていまうバグを修正
//$(document).on 'turbolinks:before-cache', ->

$(document).on('turbolinks:before-cache', function() {
  console.log('turbolinks:before-cache');
  $('#calendar').empty()
});
