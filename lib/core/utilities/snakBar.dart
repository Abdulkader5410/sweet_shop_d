import 'package:flutter/material.dart';
import 'package:sweet_shop_d/core/app_language/app_locale.dart';
import 'package:sweet_shop_d/core/app_theme/app_theme.dart';
import 'package:sweet_shop_d/main.dart';

class ShowSnakBar {
  void MessageSnakBar({
    required BuildContext context,
    required message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 2,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        dismissDirection: DismissDirection.endToStart,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.green,
        margin: const EdgeInsets.all(8),
        content: Directionality(
          textDirection: localization.currentLocale!.languageCode == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: Text(
            message,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: Theme.of(context).brightness == Brightness.dark
                    ? lightColor
                    : darkPrimaryColor),
          ),
        )));
  }

  void PayedSnakbar(
      {required BuildContext context,
      required message,
      required VoidCallback onPress}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        action: SnackBarAction(
          label: AppLocale.goToOrdersPage,
          onPressed: onPress,
        ),
        elevation: 2,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        dismissDirection: DismissDirection.endToStart,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.green,
        margin: const EdgeInsets.all(8),
        content: Directionality(
          textDirection: localization.currentLocale!.languageCode == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: Text(
            message,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: Theme.of(context).brightness == Brightness.dark
                    ? lightColor
                    : darkPrimaryColor),
          ),
        )));
  }

  void ErrorSnakBar({required BuildContext context, required message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        dismissDirection: DismissDirection.endToStart,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
        margin: const EdgeInsets.all(8),
        content: Directionality(
          textDirection: localization.currentLocale!.languageCode == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: Text(
            message,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: Theme.of(context).brightness == Brightness.dark
                    ? lightColor
                    : darkPrimaryColor),
          ),
        )));
  }
}
