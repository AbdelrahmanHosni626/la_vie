import '../../../models/login/login_model.dart';

abstract class LoginStates {}

class InitialLoginState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates
{
  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}

class LoginChangePasswordVisibilityState extends LoginStates {}