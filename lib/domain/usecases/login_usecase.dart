
// login usecase class in data layer to implement the repository

class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase({@required this.loginRepository});

  Future<Either<Failure, LoginResponse>> login(
      LoginRequest loginRequest) async {
    return await loginRepository.login(loginRequest);
  }
}

