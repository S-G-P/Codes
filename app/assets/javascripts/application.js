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
//= require moment
//= require fullcalendar
//= require_tree .

$(document).ready(showCalendar());

var windowWidth = $(window).width();
var windowSm = 640;
// カレンダーの高さをレスポンシブ対応
var responsiveHeight;
// 時間を表示するか
var isDisplayEventTime = true;
if (windowWidth <= windowSm) {
    //横幅640px以下のとき（つまりスマホ時）に行う処理を書く
    responsiveHeight = 650;    
    isDisplayEventTime = false;
} else {
    //横幅640px超のとき（タブレット、PC）に行う処理を書く
    responsiveHeight = 900;
}

function showCalendar() {
  // JSONオブジェクトを取得
  $.getJSON(window.location.href + ".json", function(json){
    // fullCalendar表示のための初期設定
    $('#calendar').fullCalendar({
      // 時刻を表示しない
      displayEventTime: isDisplayEventTime,
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
      height: responsiveHeight,
      dayClick: function(){
        // alert('sample');
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
      },
      editable: true,
      eventDrop: function(event, delta, revertFunc) {
        $.ajax({
          async: true,
          url: window.location.href + "/" + event.id,
          type: "GET",
          dataType: 'json',
          cache: true,
          success: function(data) {
            // 変更先の日付を配列で取得
            var scheduleStart = event.start.toArray();
            
            // 変更前の予定の終了日時をミリ秒で取得
            var scheduleEndOld = Date.parse(data.date_to.slice(0,10).replace(/-/g, '/'));
            var scheduleEnd = scheduleEndOld + delta.days() * 24 * 60 * 60 * 1000;
            scheduleEnd = new Date(scheduleEnd);
            
            // alert(scheduleEnd.getFullYear());
            // alert(scheduleEnd.getMonth() + 1);
            // alert(scheduleEnd.getDate());
            
            // 各配列の値を変数に格納
            var scheduleStartNewYear = scheduleStart[0];
            var scheduleStartNewMonth = scheduleStart[1] + 1;
            var scheduleStartNewDay = scheduleStart[2];
            var scheduleStartNewHour = scheduleStart[3];
            var scheduleStartNewMinute = scheduleStart[4];
            var scheduleStartNewSecound = scheduleStart[5];
            
            var scheduleEndNewYear = scheduleEnd.getFullYear();
            var scheduleEndNewMonth = scheduleEnd.getMonth() + 1;
            var scheduleEndNewDay = scheduleEnd.getDate();
            
            // alert(delta.days());
    
            $.ajax({
              async: true,
              url: window.location.href + "/" + event.id,
              type: "PUT",
              data: {
                "schedule[date_from(1i)]": scheduleStartNewYear,
                "schedule[date_from(2i)]": scheduleStartNewMonth,
                "schedule[date_from(3i)]": scheduleStartNewDay,
                "schedule[date_from(4i)]": scheduleStartNewHour,
                "schedule[date_from(5i)]": scheduleStartNewMinute,
                "schedule[date_from(6i)]": scheduleStartNewSecound,
                "schedule[date_to(1i)]": scheduleEndNewYear,
                "schedule[date_to(2i)]": scheduleEndNewMonth,
                "schedule[date_to(3i)]": scheduleEndNewDay,
              },
              dataType: 'json',
              cache: false
            })
          }
        })
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
          textColor: 'white'  // an option!
        }
      )
    });
    // scheduleを追加
    $('#calendar').fullCalendar( 'addEventSource',json_array)
  });
} // -- showCalendar() end --

