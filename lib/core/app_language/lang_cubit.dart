
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LanguageCubit extends Cubit<Locale> {
//   static const String langKey = 'selected_language';

//   LanguageCubit() : super(const Locale('ar')) {
//     _loadSavedLanguage();
//   }

//   Future<void> changeLanguage(String langCode) async {
//     final newLocale = Locale(langCode);
//     emit(newLocale);
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(langKey, langCode);
//   }

//   Future<void> _loadSavedLanguage() async {
//     final prefs = await SharedPreferences.getInstance();
//     final langCode = prefs.getString(langKey) ?? 'ar';
//     emit(Locale(langCode));
//   }
// }
