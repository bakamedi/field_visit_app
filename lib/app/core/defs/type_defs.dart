import 'package:field_visit_app/app/core/helpers/either/either.dart';

typedef Json = Map<String, dynamic>;
typedef FutureEither<L, R> = Future<Either<L, R>>;
