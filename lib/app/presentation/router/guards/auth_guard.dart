import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../global/controllers/session/session_gc.dart';

Future<String?> authGuard(BuildContext context, GoRouterState state) async {
  final authenticatedUser = sessionGP.read().state;

  return null;
}
