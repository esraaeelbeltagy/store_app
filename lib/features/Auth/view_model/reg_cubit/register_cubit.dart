import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/Dio_Helper/dio_helper.dart';
import '../../../../core/services/Dio_Helper/end_points.dart';
import '../../../../core/services/Sh_Helper/shared_helper.dart';
import '../../../../core/services/Sh_Helper/shared_keys.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);

  final userController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final passwordConfirmController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool obscureConfirmSignUp = false;
//* function change obsecure state password
  void changeConfirmObscureSignUp() {
    obscureConfirmSignUp = !obscureConfirmSignUp;
    emit(ChangeObsecureSignUpConfirmPasswordState());
  }

//*function signUp API
  Future<void> signUp() async {
    emit(SignUpLoadingState());
    await DioHelper.post(endPoint: EndPoints.register, data: {
      "name": userController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "password_confirmation": passwordConfirmController.text,
    }).then((value) async {
      await SharedHelper.set(
        key: SharedKeys.token,
        value: value.data["data"]["token"],
      );
      await SharedHelper.set(
        key: SharedKeys.userId,
        value: value.data["data"]["user"]["id"],
      );
      await SharedHelper.set(
        key: SharedKeys.userName,
        value: value.data["data"]["user"]["name"],
      );
      await SharedHelper.set(
        key: SharedKeys.userEmail,
        value: value.data["data"]["user"]["email"],
      );
      emit(SignUpSuccessState());
    }).catchError((error) {
      if(error is DioException){
        print(error.response?.data);

      }

      emit(SignUpFailureState());
      print(error.toString());
      throw (error);
    });
  }


}