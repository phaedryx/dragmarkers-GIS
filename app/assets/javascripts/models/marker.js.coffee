class App.Marker extends Spine.Model
  @configure 'Marker', 'latitude', 'longitude', 'icon'
  @extend Spine.Model.Ajax
  
  constructor: ({latitude: @latitude, longitude: @longitude, icon: @icon}) ->
    super
    @_marker = new google.maps.Marker(
      position: new google.maps.LatLng(@latitude, @longitude)
      icon: @icon
      draggable: true
    )
    google.maps.event.addListener(@_marker, 'dragend', (event) => @dragEnd(event))
    google.maps.event.addListener(@_marker, 'rightclick', (event) => @rightClick(event))

  dragEnd: (event) ->
    console.log "dragend"
    latitude = @_marker.getPosition().lat()
    longitude = @_marker.getPosition().lng()
    @updateAttributes({latitude: latitude, longitude: longitude})

  rightClick: (event) ->
    @_marker.setMap(null)
    @destroy()

  setMap: (map) ->
    @_marker.setMap(map)
  