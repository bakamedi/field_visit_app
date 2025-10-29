import 'package:field_visit_app/app/presentation/global/extensions/strings_ext.dart';
import 'package:field_visit_app/app/presentation/global/extensions/widgets_ext.dart';
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
      appBar: AppBar(title: const Text('Detalle'), elevation: 0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRow('Código', item.code),
          _buildRow('Fecha', item.createdAt?.toString().getFormattedDate()),
          20.h,

          // Mapa minimalista
          if (item.lat != null && item.lng != null)
            MapThumbnailGW(
              lat: item.lat!,
              lng: item.lng!,
              height: 500,
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
      ).padding(const EdgeInsets.all(16)),
    );
  }

  Widget _buildRow(String label, String? value) {
    return Row(
      children: [
        Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(value ?? '-'),
      ],
    ).padding(const EdgeInsets.symmetric(vertical: 4));
  }
}
