import 'package:field_visit_app/app/core/defs/type_defs.dart';
import 'package:field_visit_app/app/core/helpers/either/either.dart';
import 'package:field_visit_app/app/core/helpers/failure.dart';
import 'package:field_visit_app/app/domain/repositories/geolocation/geolocation_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class GeolocationRepositoryImpl extends GeolocationRepository {
  @override
  FutureEither<Failure, LatLng?> getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition();
      return Right(LatLng(position.latitude, position.longitude));
    } catch (e) {
      return const Left(GeolocatorFailure('Could not get current location'));
    }
  }
}
