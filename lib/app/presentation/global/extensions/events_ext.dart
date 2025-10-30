import 'package:field_visit_app/app/domain/models/items/item_model.dart';

extension EventsExt on List<ItemModel> {
  void sortByCreatedAt({bool ascending = true}) {
    sort((a, b) {
      final dateA = DateTime.tryParse(a.createdAt ?? '');
      final dateB = DateTime.tryParse(b.createdAt ?? '');
      if (dateA == null || dateB == null) return 0;
      return ascending ? dateA.compareTo(dateB) : dateB.compareTo(dateA);
    });
  }
}
