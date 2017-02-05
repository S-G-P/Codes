# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

showCalendar = ->
  # JSONオブジェクトを取得
  $.getJSON window.location.href + '.json', (json) ->
    # fullCalendar表示のための初期設定
    $('#calendar').fullCalendar
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
        alert 'sample'
        return
      eventClick: (calEvent, jsEvent, view) ->
        window.location.href = window.location.href + '/' + calEvent.id
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
    # scheduleの情報をjson形式で配列に格納
    json_array = []
    $.each json, (index, val) ->
      json_array.push
        id: val.id
        title: val.title
        start: val.date_from
        end: val.date_to
        color: '#999999'
        textColor: 'white'
      return
    # scheduleを追加
    $('#calendar').fullCalendar 'addEventSource', json_array
    return
  return

$(document).ready showCalendar()
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
