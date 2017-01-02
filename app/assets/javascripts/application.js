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
  // JSONオブジェクトを取得
  $.getJSON(window.location.href + ".json", function(json){
    // fullCalendar表示のための初期設定
    $('#calendar').fullCalendar({
      eventRender : function(event, eventElement) {
        if (event.imageurl) {
          eventElement.find("div.fc-content").prepend("<img src='" + event.imageurl +"' width='20' height='20'>");
        }
      },
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
      eventClick: function(calEvent, jsEvent, view) {
        window.location.href = window.location.href + "/" + calEvent.id;
      },
      eventMouseover: function( event, jsEvent, view ) { 
        $(this).css('border-color', 'black');
        $(this).css('border-width', '2px');
        $(this).css("cursor","pointer");
      },
      eventMouseout: function( event, jsEvent, view ) { 
        $(this).css('border-color', '#999999');
        $(this).css('border-width', '0px');
      }
    });
    // scheduleの情報をjson形式で配列に格納
    var json_array = [];
    $.each(json, function(index, val) {
      json_array.push(
        {
          id: val.id,
          title: val.title,
          start: val.date_from,
          end: val.date_to,
          color: '#999999',     // an option!
          textColor: 'white',  // an option!
        }
      )
    });
    // scheduleを追加
    $('#calendar').fullCalendar( 'addEventSource',json_array);
    $('#calendar').fullCalendar( 'addEventSource', [{
                title: "<img src='http://openweathermap.org/img/w/01n.png'></i>",
                start: Date.now(),
        }]);
    });
} // -- showCalendar() end --
