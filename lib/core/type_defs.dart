import "./failure.dart";
import "package:dartz/dartz.dart";

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = FutureEither<void>;
