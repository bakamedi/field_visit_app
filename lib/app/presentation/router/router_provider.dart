import 'package:field_visit_app/app/presentation/router/app_routes/qr_scan_route.dart';
import 'package:field_visit_app/app/presentation/router/app_routes/supervisor_route.dart';
import 'package:field_visit_app/app/presentation/router/app_routes/technician_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/providers.dart';

import 'package:go_router/go_router.dart';
import 'app_routes/select_role_route.dart';
import 'app_routes/splash_route.dart';

final rootNavigationKey = GlobalKey<NavigatorState>();

final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: SplashRoute.path,
    routes: [
      QrScanRoute.route,
      SupervisorRoute.route,
      TechnicianRoute.route,
      SplashRoute.route,
      SelectRoleRoute.route,
    ],
  ),
);
