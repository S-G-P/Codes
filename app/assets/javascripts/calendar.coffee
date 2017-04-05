# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

showCalendar = ->
  # JSONオブジェクトを取得
  $.getJSON window.location.href + '.json', (json) ->
    # fullCalendar表示のための初期設定
    $('#calendar').fullCalendar
      header: {
        left: 'prev,next today myCustomButton'
        center: 'title'
        right: 'month,agendaWeek,agendaDay,listMonth'
      }
      contentHeight: 1200
      minTime: '06:00:00'
      maxTime: '24:00:00'
      timeFormat: 'H(:mm)'
      displayEventTime: isDisplayEventTime
      defaultView: 'month'
      weekends: true
      monthNames: [
        '1月'
        '2月'
        '3月'
        '4月'
        '5月'
        '6月'
        '7月'
        '8月'
        '9月'
        '10月'
        '11月'
        '12月'
      ]
      monthNamesShort: [
        '1月'
        '2月'
        '3月'
        '4月'
        '5月'
        '6月'
        '7月'
        '8月'
        '9月'
        '10月'
        '11月'
        '12月'
      ]
      dayNames: [
        '日曜日'
        '月曜日'
        '火曜日'
        '水曜日'
        '木曜日'
        '金曜日'
        '土曜日'
      ]
      dayNamesShort: [
        '日'
        '月'
        '火'
        '水'
        '木'
        '金'
        '土'
      ]
      height: responsiveHeight
      dayClick: ->
        window.location.href = window.location.href.replace(/calendar/g, 'schedules') + '/new'
        return
      eventClick: (calEvent, jsEvent, view) ->
        window.location.href = window.location.href.replace(/calendar/g, 'schedules') + '/' + calEvent.id
        return
      eventMouseover: (event, jsEvent, view) ->
        $(this).css 'border-color', 'black'
        $(this).css 'border-width', '2px'
        $(this).css 'cursor', 'pointer'
        return
      eventMouseout: (event, jsEvent, view) ->
        $(this).css 'border-color', '#999999'
        $(this).css 'border-width', '0px'
        return
      editable: true
      eventDrop: (event, delta, revertFunc) ->
        # 変更先の日付を配列で取得
        scheduleStart = event.start.toArray()
        # 各配列の値を変数に格納
        scheduleNewYear = scheduleStart[0]
        scheduleNewMonth = scheduleStart[1] + 1
        scheduleNewDay = scheduleStart[2]
        scheduleNewHour = scheduleStart[3]
        scheduleNewMinute = scheduleStart[4]
        scheduleNewSecound = scheduleStart[5]
        requestUrl = window.location.href.replace(/calendar/g, 'schedules') + '/' + event.id
        jqXHR = $.ajax(
          async: true
          url: requestUrl
          type: 'PUT'
          data:
            'schedule[date_from(1i)]': scheduleNewYear
            'schedule[date_from(2i)]': scheduleNewMonth
            'schedule[date_from(3i)]': scheduleNewDay
            'schedule[date_from(4i)]': scheduleNewHour
            'schedule[date_from(5i)]': scheduleNewMinute
            'schedule[date_from(6i)]': scheduleNewSecound
          dataType: 'json'
          cache: false)
        return
    # scheduleの情報をjson形式で配列に格納
    json_array = []
    $.each json, (index, val) ->
      json_array.push
        id: val.id
        title: val.title
        start: val.date_from
        end: val.date_to
        color: '#FF8A80'
        textColor: 'white'
      return
    # scheduleを追加
    $('#calendar').fullCalendar 'addEventSource', json_array
    return
  return

$(window).load showCalendar()
windowWidth = $(window).width()
windowSm = 640
# カレンダーの高さをレスポンシブ対応
responsiveHeight = undefined
# 時間を表示するか
isDisplayEventTime = true
if windowWidth <= windowSm
  #横幅640px以下のとき（つまりスマホ時）に行う処理を書く
  responsiveHeight = 650
  isDisplayEventTime = false
else
  #横幅640px超のとき（タブレット、PC）に行う処理を書く
  responsiveHeight = 900
# -- showCalendar() end --
