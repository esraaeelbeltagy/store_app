import 'package:book_store/app.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/cubit/bloc_observer.dart';
import 'core/services/Dio_Helper/dio_helper.dart';
import 'core/services/Sh_Helper/shared_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
  await DioHelper.init();
  SharedHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const StoreApp());

}

