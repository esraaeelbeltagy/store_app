import 'package:book_store/config/themes/light_theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/routes/app_routes.dart';
import 'core/utils/app_strings.dart';
import 'features/Auth/view_model/login_cubit/login_cubit.dart';
import 'features/Auth/view_model/reg_cubit/register_cubit.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => LoginCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: ligthTheme(),
            onGenerateRoute: AppRoutes.onGenerateRoute,
          );
        },
      ),
    );
    /*
    MultiBlocProvider(
      providers: const [
       /// عشان دي فاضية 
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: ligthTheme(),
            onGenerateRoute: AppRoutes.onGenerateRoute,
          );
        },
      ),
    );
    */
  }
}
