import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/Dio_Helper/dio_helper.dart';
import '../../../../core/services/Dio_Helper/end_points.dart';
import '../../../../core/services/Sh_Helper/shared_helper.dart';
import '../../../../core/services/Sh_Helper/shared_keys.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool obscureConfirmSignIn = false;
//* function change obsecure state password
  void changeConfirmObscureSignIn() {
    obscureConfirmSignIn = !obscureConfirmSignIn;
    emit(ChangeObsecureSignInpConfirmPasswordState());
  }

//*function signUp API
  Future<void> signIn() async {
    emit(SignInLoadingState());
    await DioHelper.post(endPoint: EndPoints.login, 
    data: {
      "email": emailController.text,
      "password": passwordController.text,
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
      emit(SignInSuccessState());
    }).catchError((error) {
       if(error is DioException){
        print(error.response?.data);

      }

      emit(SignInFaluileState());
      print(error.toString());
      throw (error);
    });
  }
}
