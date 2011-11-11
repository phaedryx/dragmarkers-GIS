#= require jquery_ujs
#= require spine/spine
#= require spine/manager
#= require spine/ajax
#= require spine/route

#= require_tree ./lib
#= require_self
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree .

$ = jQuery.sub()

class App extends Spine.Controller
  constructor: ->
    super
    @html JST["views/markers/index"]
    options = {
      zoom: 6
      center: new google.maps.LatLng(39.828175, -98.5795)
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    @_map = new google.maps.Map(document.getElementById('map'), options)
    @_offset = $("#map").position()
    @_overlay = new google.maps.OverlayView()
    @_overlay.draw = ->
    @_overlay.setMap(@_map)
    $(".marker").draggable({
      helper: 'clone'
      containment: 'parent'
      stop: (event, ui) => @placeMarker(event, ui)
    })
    # App.Marker.fetch()

  placeMarker: (event, ui) ->
    console.log event
    x = event.pageX - @_offset.left
    y = event.pageY - @_offset.top
    point = new google.maps.Point(x,y)
    latlng = @_overlay.getProjection().fromContainerPixelToLatLng(point)
    icon = ui.helper[0].src
    marker = App.Marker.create({
      latitude: latlng.lat()
      longitude: latlng.lng()
      icon: icon
    })
    marker.setMap(@_map)


window.App = App