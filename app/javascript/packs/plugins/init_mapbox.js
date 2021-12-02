import mapboxgl from 'mapbox-gl';

    const buildMap = (mapElement) => {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
      const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v10'
      });

      return map;
    };

    const addMarkersToMap = (map, markers) => {
      markers.forEach((marker) => {
        console.log(marker)
        new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);
      });
    };

    const fitMapToMarkers = (map, markers) => {

      if (markers.length > 0) {
        const bounds = new mapboxgl.LngLatBounds();
        map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
        markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
      }
    };

    const initMapbox = () => {
      const mapElement = document.getElementById('map');
      if (mapElement) {
        const map = buildMap(mapElement)
        const markers = JSON.parse(mapElement.dataset.markers)
        addMarkersToMap(map, markers)
        fitMapToMarkers(map, markers)
      };
    };

export { initMapbox };
