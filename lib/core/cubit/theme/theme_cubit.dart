import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  static ThemeCubit get(context) {
    return BlocProvider.of(context);
  }

  bool isDark = false;
  String image = 'assets/images/morning.jpg';
  void changeTheme() {
    isDark = !isDark;
    emit(ThemeChangeState());
  }

  void changePhoto() {
    if (isDark) {
      image = 'assets/images/evening.jpg';
    }
    emit(changePhotoState());
  }
}
