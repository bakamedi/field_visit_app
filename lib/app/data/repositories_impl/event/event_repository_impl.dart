import 'package:field_visit_app/app/data/source/providers/store/store_provider.dart';
import 'package:field_visit_app/app/domain/models/items/item_model.dart';
import 'package:field_visit_app/app/domain/repositories/event/event_repository.dart';

class EventRepositoryImpl extends EventRepository {
  EventRepositoryImpl({required StoreProvider storeProvider})
    : _storeProvider = storeProvider;

  final StoreProvider _storeProvider;

  @override
  Future<void> addEvent(ItemModel event) async {
    await _storeProvider.createRecord(event.toJson());
  }

  @override
  Future<List<ItemModel>> getAll() async {
    final result = await _storeProvider.getAllRecords();
    return result
        .map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
