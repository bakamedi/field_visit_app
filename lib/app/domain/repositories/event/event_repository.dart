import 'package:field_visit_app/app/domain/models/items/item_model.dart';

abstract class EventRepository {
  Future<List<ItemModel>> getAll();
  Future<List<ItemModel>> getEventsByUser(String userId);
  Future<void> addEvent(ItemModel event);
}
