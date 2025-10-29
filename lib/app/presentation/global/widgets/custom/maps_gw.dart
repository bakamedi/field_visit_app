import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapThumbnailGW extends StatelessWidget {
  final double height;
  final double lat;
  final double lng;
  final double markerHeight;
  final double markerWidth;
  final double iconMarkerSize;

  const MapThumbnailGW({
    super.key,
    required this.lat,
    required this.lng,
    this.height = 120,
    this.markerHeight = 30,
    this.markerWidth = 30,
    this.iconMarkerSize = 30,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 120,
        child: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(lat, lng),
            initialZoom: 14,
            interactionOptions: const InteractionOptions(
              flags: InteractiveFlag.none, // 🔒 Desactiva zoom/movimiento
            ),
          ),
          children: [
            TileLayer(
              urlTemplate:
                  'https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png',
              subdomains: const ['a', 'b', 'c'],
              userAgentPackageName: 'com.example.app',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  width: markerWidth,
                  height: markerHeight,
                  point: LatLng(lat, lng),
                  child: Icon(
                    Icons.location_pin,
                    color: Colors.redAccent,
                    size: iconMarkerSize,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
