class App.Marker extends Spine.Model
  @configure 'Marker', 'latitude', 'longitude', 'icon'
  @extend Spine.Model.Ajax
  
  constructor: ({latitude: @latitude, longitude: @longitude, icon: @icon}) ->
    @_marker = new google.maps.Marker(
      position: new google.maps.LatLng(@latitude, @longitude)
      icon: @icon
      draggable: true
    )
    super
  
  setMap: (map) ->
    @_marker.setMap(map)
  