import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweet_shop_d/core/app_theme/app_theme.dart';
import 'package:sweet_shop_d/core/app_theme/cache_theme.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeEvent>((event, emit) async {
      if (event is GetCurrentThemeEvent) {
        final themeIndex = await CashThemeHelper().getChashedTheme();

        final theme = MyThemes.values
            .firstWhere((myTheme) => myTheme.index == themeIndex);

        emit(LoadedThemeState(themeData: myThemeData[theme]!));
      } else if (event is ChangeThemeEvent) {
        final themeIndex = event.myThemes.index;

        await CashThemeHelper().chashedTheme(themeIndex);

        emit(LoadedThemeState(themeData: myThemeData[event.myThemes]!));
      }
    });
  }
}

