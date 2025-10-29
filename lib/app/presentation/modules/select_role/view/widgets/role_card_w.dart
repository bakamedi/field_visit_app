import 'package:field_visit_app/app/presentation/global/extensions/widgets_ext.dart';
import 'package:flutter/material.dart';

class RoleCardW extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const RoleCardW({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
            width: 1.6,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                size: 28,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            16.w,
            Column(
              spacing: 6,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 13, color: Colors.black54),
                ),
              ],
            ).expanded,
            8.w,

            isSelected
                ? Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Icon(
                      Icons.check_circle,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  )
                : const SizedBox(width: 28, height: 28),
          ],
        ).padding(const EdgeInsets.all(16.0)),
      ),
    );
  }
}
