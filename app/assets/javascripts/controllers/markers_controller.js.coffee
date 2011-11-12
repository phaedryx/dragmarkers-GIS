$ = jQuery.sub()
Marker = App.Marker

class App.MarkersController extends Spine.Controller
  elements:
    ".marker" : "markerIcons"

  constructor: ->
    super
    @html JST["views/markers/index"]
    @createMap()
    @createMapOverlay()
    @makeIconsDraggable()
    @addExistingMarkers()

  createMap: ->
    options = {
      zoom: 6
      center: new google.maps.LatLng(39.828175, -98.5795)
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    @map = new google.maps.Map(document.getElementById('map'), options)

  createMapOverlay: ->
    @overlay = new google.maps.OverlayView()
    @overlay.draw = ->
    @overlay.setMap(@map)

  makeIconsDraggable: ->
    @markerIcons.draggable({
      helper: 'clone'
      stop: (event, ui) => @placeMarker(event, ui)
    })

  placeMarker: (event, ui) ->
    offset = $("#map").position()
    x = event.pageX - offset.left
    y = event.pageY - offset.top
    point = new google.maps.Point(x,y)
    latlng = @overlay.getProjection().fromContainerPixelToLatLng(point)
    icon = ui.helper[0].src
    marker = App.Marker.create({
      latitude: latlng.lat()
      longitude: latlng.lng()
      icon: icon
    })
    marker.setMap(@map)

  addExistingMarkers: ->
    Marker.fetch()
    @markers = Marker.all()
    marker.setMap(@map) for marker in @markers