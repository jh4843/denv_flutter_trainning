import "package:dartz/dartz.dart";

// func to implement the repository in data layer

 class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource loginDataSource;

  LoginRepositoryImpl({@required this.loginDataSource});

  @override
  Future<Either<Failure, LoginResponse>> login(
      LoginRequest loginRequest) async {
    try {
      final response = await loginDataSource.login(loginRequest);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
