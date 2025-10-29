import 'package:field_visit_app/app/domain/models/items/item_model.dart';
import 'package:field_visit_app/app/presentation/modules/detail/controller/detail_state.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';

final detailProvider = Provider.state<DetailController, DetailState>(
  (_) => DetailController(DetailState.initialState),
);

class DetailController extends StateNotifier<DetailState> {
  DetailController(super.initialState) {
    _onInit();
  }

  void _onInit() {
    state = state.copyWith(mapController: MapController());
  }

  void selectItem(ItemModel item) {
    state = state.copyWith(itemSelected: item);
  }
}
