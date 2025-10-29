import 'package:flutter/material.dart';

class StaticMapThumbnailW extends StatelessWidget {
  final double lat;
  final double lng;

  const StaticMapThumbnailW({super.key, required this.lat, required this.lng});

  @override
  Widget build(BuildContext context) {
    final url =
        'https://staticmap.openstreetmap.de/staticmap.php?center=$lat,$lng&zoom=15&size=400x200&markers=$lat,$lng,red-pushpin';

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        url,
        height: 120,
        width: double.infinity,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return const Center(
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(strokeWidth: 1.5),
            ),
          );
        },
        errorBuilder: (_, _, _) => Container(
          height: 120,
          color: Colors.grey[300],
          alignment: Alignment.center,
          child: const Icon(Icons.map, color: Colors.grey, size: 40),
        ),
      ),
    );
  }
}
