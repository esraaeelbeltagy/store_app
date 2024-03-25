part of 'register_cubit.dart';

sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

class SignUpLoadingState extends RegisterState {}

class SignUpSuccessState extends RegisterState {}

class SignUpFailureState extends RegisterState {}
class ChangeObsecureSignUpConfirmPasswordState extends RegisterState {}
