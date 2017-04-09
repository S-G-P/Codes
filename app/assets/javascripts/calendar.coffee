# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

windowFade = ->
  $('#fade').each ->
    $('#fade').fadeOut(1000).height $('body').height()
    $('a').click ->
      url = $(this).attr('href')
      if @href.match(location.hostname) and $(this).attr('href').charAt(0) != '#' and !$(this).attr('rel') and !$(this).attr('target')
        LinkURL = $(this).attr('href')
        $('#fade').fadeIn 1000, ->
          location.href = LinkURL
          return
        return false
      return
    return
  return

$('head').append '<style type="text/css">#fade{display:block;height:' + $(window).height() + 'px}</style>'

window.onload = ->
  windowFade()
  return

window.onunload = ->
  windowFade()
  return

showCalendar = ->
  # JSONオブジェクトを取得
  $.getJSON window.location.href + '.json', (json) ->
    # fullCalendar表示のための初期設定
    $('#calendar').fullCalendar
      header: {
        left: 'prev,next today myCustomButton'
        center: 'title'
        right: headerRightContents
      }
      minTime: '06:00:00'
      maxTime: '24:00:00'
      timeFormat: 'H(:mm)'
      views: {
        month: {
          titleFormat: 'YYYY年 M月'
          eventLimit: true
        }
        agendaWeek: {
          titleFormat: 'YYYY年 M月 D日'
        }
        agendaDay: {
          titleFormat: 'YYYY年 M月 D日'          
        }
        listMonth: {
          titleFormat: 'YYYY年 M月'
        }
      }
      buttonText: {
        today:    '今日',
        month:    '月',
        week:     '週',
        day:      '日',
        list:     '一覧'
      }
      displayEventTime: isDisplayEventTime
      noEventsMessage: '予定が一件も登録されていません'
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
      forceEventDuration: true
      dayClick: ->
        window.location.href = window.location.href.replace(/calendar/g, 'schedules') + '/new'
        return
      eventClick: (calEvent, jsEvent, view) ->
        window.location.href = window.location.href.replace(/calendar/g, 'schedules') + '/' + calEvent.id
        return
      eventMouseover: (event, jsEvent, view) ->
        $(this).css 'border-color', 'gray'
        $(this).css 'border-width', '1px'
        $(this).css 'cursor', 'pointer'
        return
      eventMouseout: (event, jsEvent, view) ->
        $(this).css 'border-color', '#999999'
        $(this).css 'border-width', '0px'
        return
      editable: true
      eventResize: (event, delta, revertFunc, jsEvent, ui, view) ->
        console.log(event)
        return
      eventDrop: (event, delta, revertFunc) ->
        # 変更先の日付を配列で取得
        scheduleStart = event.start.toArray()
        scheduleEnd = event.end.toArray()
        console.log(event)   
        # 各配列の値を変数に格納
        scheduleNewYear = scheduleStart[0]
        scheduleNewMonth = scheduleStart[1] + 1
        scheduleNewDay = scheduleStart[2]
        scheduleNewHour = scheduleStart[3]
        scheduleNewMinute = scheduleStart[4]
        scheduleNewSecound = scheduleStart[5]
        scheduleNewEndYear = scheduleEnd[0]
        scheduleNewEndMonth = scheduleEnd[1] + 1
        scheduleNewEndDay = scheduleEnd[2]
        scheduleNewEndHour = scheduleEnd[3] + 1
        scheduleNewEndMinute = scheduleEnd[4]
        scheduleNewEndSecound = scheduleEnd[5]
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
            'schedule[date_to(1i)]': scheduleNewEndYear
            'schedule[date_to(2i)]': scheduleNewEndMonth
            'schedule[date_to(3i)]': scheduleNewEndDay
            'schedule[date_to(4i)]': scheduleNewEndHour
            'schedule[date_to(5i)]': scheduleNewEndMinute
            'schedule[date_to(6i)]': scheduleNewEndSecound
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


# ウィンドウサイズを取得
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
  headerRightContents = 'month,listMonth'
else
  #横幅640px超のとき（タブレット、PC）に行う処理を書く
  responsiveHeight = 1070
  headerRightContents = 'month,agendaWeek,agendaDay,listMonth'

# カレンダーをレンダリングする
$ showCalendar()


# 位置情報取得
success = (pos) ->
  # 緯度
  document.querySelector('#latitude').textContent = pos.coords.latitude
  # 経度
  document.querySelector('#longitude').textContent = pos.coords.longitude
  # 移動方向
  document.querySelector('#heading').textContent = pos.coords.heading
  # 移動速度
  document.querySelector('#speed').textContent = pos.coords.speed
  requestUrl = 'https://' + location.host + '/location'
  jqXHR = $.ajax(
    async: true
    url: requestUrl
    type: 'POST'
    data:
      'address' : "none"
      'latitude': pos.coords.latitude
      'longitude': pos.coords.longitude
    dataType: 'json'
    cache: false)
  return

error = (err) ->
  console.warn 'ERROR(' + err.code + '): ' + err.message
  return
  
document.addEventListener 'DOMContentLoaded', (->
  options = 
    enableHighAccuracy: true
    timeout: 60000
    maximumAge: 0
  # 位置情報取得
  window.navigator.geolocation.watchPosition success, error, options
  return
), false