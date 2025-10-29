import 'package:field_visit_app/app/core/defs/type_defs.dart';
import 'package:field_visit_app/app/core/helpers/failure.dart';
import 'package:latlong2/latlong.dart';

abstract class GeolocationRepository {
  FutureEither<Failure, LatLng?> getCurrentLocation();
}
