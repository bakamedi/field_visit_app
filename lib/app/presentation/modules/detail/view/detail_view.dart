import 'package:field_visit_app/app/presentation/global/widgets/custom/maps_gw.dart';
import 'package:field_visit_app/app/presentation/modules/detail/controller/detail_controller.dart';
import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailController controller = detailProvider.read();
    final item = controller.state.itemSelected;

    if (item == null) {
      return const Scaffold(body: Center(child: Text('No item selected')));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRow('Código', 'code'),
            _buildRow('Fecha', 'createdAt?.toString()'),
            const SizedBox(height: 20),

            // Mapa minimalista
            if (item.lat != null && item.lng != null)
              MapThumbnailGW(
                lat: item.lat!,
                lng: item.lng!,
                height: 250,
                iconMarkerSize: 36,
                markerHeight: 40,
                markerWidth: 40,
              )
            else
              const Text(
                'No hay coordenadas disponibles',
                style: TextStyle(color: Colors.grey),
              ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value ?? '-', style: const TextStyle(color: Colors.black87)),
        ],
      ),
    );
  }
}
