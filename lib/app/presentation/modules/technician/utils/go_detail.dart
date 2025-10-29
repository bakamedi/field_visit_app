import 'package:field_visit_app/app/domain/models/items/item_model.dart';
import 'package:field_visit_app/app/presentation/global/utils/router_util.dart';
import 'package:field_visit_app/app/presentation/modules/detail/controller/detail_controller.dart';
import 'package:field_visit_app/app/presentation/router/app_routes/detail_route.dart';

void goDetail(ItemModel item) {
  final controller = detailProvider.read();
  controller.selectItem(item);
  RouterUtil.push(DetailRoute.path);
}
