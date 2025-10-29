import 'package:field_visit_app/app/domain/models/items/item_model.dart';
import 'package:field_visit_app/app/presentation/global/extensions/strings_ext.dart';
import 'package:field_visit_app/app/presentation/global/extensions/widgets_ext.dart';
import 'package:field_visit_app/app/presentation/global/widgets/custom/maps_gw.dart';
import 'package:field_visit_app/app/presentation/modules/technician/utils/go_detail.dart';
import 'package:flutter/material.dart';

class TechnicianBodyW extends StatelessWidget {
  const TechnicianBodyW({super.key, required this.events});

  final List<ItemModel> events;

  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) {
      return const Center(
        child: Text(
          'Sin registros',
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 120),
      itemCount: events.length,
      separatorBuilder: (_, _) => 16.h,
      itemBuilder: (_, index) {
        final event = events[index];
        final code = event.code ?? 'Sin código';
        final date = event.createdAt?.getFormattedDate() ?? 'Sin fecha';

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                onTap: () => goDetail(event),
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  Icons.qr_code_2_rounded,
                  color: Colors.blueAccent,
                  size: 32,
                ),
                title: Text(
                  code,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                trailing: Text(
                  date,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
              if (event.lat != null && event.lng != null)
                MapThumbnailGW(
                  lat: event.lat!,
                  lng: event.lng!,
                ).padding(const EdgeInsets.only(top: 8)),
            ],
          ).padding(const EdgeInsets.all(12)),
        );
      },
    );
  }
}
