// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../view_model/reg_cubit/register_cubit.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: ListView(
          padding: EdgeInsets.all(20.h),
          children: [
            Center(
              child: Container(
                width: 200.h,
                height: 200.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset(
                      Assets.logo,
                      fit: BoxFit.cover,
                    ).image,
                  ),
                ),
              ),
            ),
            CustomText(
                text: "Get Started",
                textAlign: TextAlign.center,
                fontSize: 30.sp,
                fontColor: AppColors.black,
                fontWeight: FontWeight.bold),
            SizedBox(
              height: 20.h,
            ),
            BlocConsumer<RegisterCubit, RegisterState>(
               listener: (BuildContext context, RegisterState state) {
                if (state is SignUpSuccessState) {
                  Navigator.pushNamed(context, Routes.signInRoute);
                }
              },
              builder: (context, state) {
                var cubit = RegisterCubit.get(context);
                return Form(
                  key: cubit.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      CustomTextFeild(

                        controller: cubit.userController,
                        validator: (data) {
                          if (data!.isEmpty) {
                            return 'this field is required';
                          }
                          if (data.length < 10) {
                            return 'Must be equal 10 or more than 10';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                        hintText: "Enter Your Name",
                        hintTextSize: 14.sp,
                        suffixIcon: Icons.person,
                        suffixIconColor: AppColors.black,
                        suffixIconSize: 22.sp,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomTextFeild(
                        controller: cubit.emailController,
                        validator: (data) {
                          final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                          if (data!.isEmpty) {
                            return 'this field is required';
                          }
                          if (!regex.hasMatch(data)) {
                            return 'your email is not valid';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        hintText: "Enter Your Email",
                        hintTextSize: 14.sp,
                        suffixIcon: Icons.email_outlined,
                        suffixIconColor: AppColors.black,
                        suffixIconSize: 22.sp,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomTextFeild(
                        controller: cubit.passwordController,
                        validator: (pass) {
                          final regex = RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                          if (pass!.isEmpty) {
                            return 'this field is required';
                          }
                          if (!regex.hasMatch(pass)) {
                            return "invalid password";
                          }

                          if (pass.length < 8) {
                            return 'your password is less than 8 character';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        hintText: "Enter Your password",
                        hintTextSize: 14.sp,
                        suffixIcon: Icons.lock_outline,
                        suffixIconColor: AppColors.black,
                        suffixIconSize: 22.sp,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomTextFeild(
                        controller: cubit.passwordConfirmController,
                        // validator : cubit.validatorOfPass,
                        validator: (pass) {
                          final regex = RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                          if (pass!.isEmpty) {
                            return 'this field is required';
                          }
                          if (!regex.hasMatch(pass)) {
                            return "invalid password";
                          }

                          if (pass.length < 8) {
                            return 'your password is less than 8 character';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        hintText: "Confirm Your Password ",
                        hintTextSize: 14.sp,
                        suffixIcon: Icons.lock_outline,
                        suffixIconColor: AppColors.black,
                        suffixIconSize: 22.sp,
                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                       (state is SignUpLoadingState)? const CircularProgressIndicator():
                      CustomButton(
                        text: "Sign Up",
                        width: double.infinity,
                        height: 47.h,
                        onTap: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.signUp();
                          }
                        },
                        backGroundColor: AppColors.primaryColor,
                        textColor: AppColors.white,
                        fontSize: 16.sp,
                        borderRadius: 20.r,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                );
              },
             
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "Already a member? ",
                  fontColor: AppColors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.signInRoute);
                  },
                  child: CustomText(
                    text: " Log In ",
                    fontColor: AppColors.primaryColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
