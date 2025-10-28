import 'package:field_visit_app/app/domain/inject_repository.dart';
import 'package:field_visit_app/app/presentation/router/app_routes/select_role_route.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';

import '../../../../domain/repositories/db/db_repository.dart';
import 'splash_state.dart';

final splashProvider = Provider.state<SplashController, SplashState>(
  (_) => SplashController(
    SplashState.initialState,
    dbRepository: Repositories.dbRep.read(),
  ),
);

class SplashController extends StateNotifier<SplashState> {
  SplashController(super.initialState, {required DbRepository dbRepository})
    : _dbRepository = dbRepository {
    init();
  }
  final DbRepository _dbRepository;

  void init() async {
    await _dbRepository.connect();
    Future.delayed(const Duration(seconds: 2), () {
      onlyUpdate(state = state.copyWith(routeName: SelectRoleRoute.path));
    });
  }
}
