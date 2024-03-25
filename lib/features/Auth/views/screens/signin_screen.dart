// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';

import '../../../../core/utils/assets_manager.dart';

import '../../view_model/login_cubit/login_cubit.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInState();
}

class _SignInState extends State<SignInScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool visible = false;

  @override
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
                text: "Welcome Back",
                textAlign: TextAlign.center,
                fontSize: 30.sp,
                fontColor: AppColors.black,
                fontWeight: FontWeight.bold),
            SizedBox(
              height: 20.h,
            ),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is SignInSuccessState) {
                  Navigator.pushNamedAndRemoveUntil(context, Routes.homeRoute,
                      (Route<dynamic> route) => false);
                }
              },
              builder: (context, state) {
                var cubit = LoginCubit.get(context);
                return Form(
                  child: Column(
                    children: [
                      CustomTextFeild(
                        controller: cubit.emailController,
                        validator: (data) {
                      
                          if (data!.isEmpty) {
                            return 'this field is required';
                          }
                          if (cubit.emailController.text != data) {
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
                          
                          if ((pass??'').isEmpty) {
                            return 'this field is required';
                          }
                          if (cubit.passwordController.text != pass) {
                            return "invalid password";
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
                        height: 70.h,
                      ),
                      (state is SignInLoadingState)
                          ? const CircularProgressIndicator()
                          : CustomButton(
                              text: "Sign In",
                              width: double.infinity,
                              height: 47.h,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.signIn();
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
                  text: "New Member? ",
                  fontColor: AppColors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.signUpRoute);
                  },
                  child: CustomText(
                    text: "Register now",
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
