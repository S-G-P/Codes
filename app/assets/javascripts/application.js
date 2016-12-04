// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//$(window).unload(function(){});
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require moment
//= require fullcalendar
//= require_tree .
$(document).ready(showCalendar());
function showCalendar() {
  $.getJSON("https://sgp-gee-awa.c9users.io/schedules.json", function(json){
    //alert("JSON Data: " + json[1].title);
    console.log(json);
    $('#calendar').fullCalendar({
      // 初期表示ビュー
      defaultView: 'month',
      // 土曜、日曜を表示
      weekends: true,
      // 月名称
      monthNames: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
      // 月略称
      monthNamesShort: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
      // 曜日名称
      dayNames: ['日曜日', '月曜日', '火曜日', '水曜日', '木曜日', '金曜日', '土曜日'],
      // 曜日略称
      dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
      dayClick: function(){
        alert('sample');
      },
       // イベントソース
      eventSources: [
          {
              events: [
                  {
                      title: 'event2',
                      start: '2016-12-04',
                      end: '2016-12-05'
                  },
                  {
                      title: 'event3',
                      start: '2016-12-05 12:30:00',
                      allDay: false // will make the time show
                  }
              ]
          }
      ]
    }); // calendar
    var json_array = [];
    $.each(json, function(index, val) {
      json_array.push(
        {
          title: val.title,
          start: val.date_from,
          end: val.date_to
        }
      )
    }); //each

    console.log(json_array);
    // イベントを追加
    $('#calendar').fullCalendar( 'addEventSource',json_array)
    
  }); //getjson
} //function    

