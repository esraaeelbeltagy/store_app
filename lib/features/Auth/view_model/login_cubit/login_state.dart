part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class SignInLoadingState extends LoginState {}

class SignInSuccessState extends LoginState {}

class SignInFaluileState extends LoginState {}
class ChangeObsecureSignInpConfirmPasswordState extends LoginState {}
