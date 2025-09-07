import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sweet_shop_d/core/api/dio_consumer.dart';
import 'package:sweet_shop_d/core/app_language/app_locale.dart';
import 'package:sweet_shop_d/core/app_theme/theme%20bloc/theme_bloc.dart';
import 'package:sweet_shop_d/core/app_theme/theme%20bloc/theme_event.dart';
import 'package:sweet_shop_d/core/app_theme/theme%20bloc/theme_state.dart';
import 'package:sweet_shop_d/features/order/presentation/bloc/order%20bloc/order_bloc.dart';
import 'package:sweet_shop_d/features/order/presentation/done%20cubit/done_cubit.dart';
import 'package:sweet_shop_d/features/order/presentation/ui/screens/all_orders_page.dart';
import 'package:sweet_shop_d/features/profile/cubit/profile%20cubit/profile_cubit.dart';
import 'package:sweet_shop_d/features/signin/cubit/signin%20cubit/signin_cubit.dart';
import 'package:sweet_shop_d/features/signin/pages/signin_page.dart';
import 'package:sweet_shop_d/get_it.dart' as get_it;

final emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
late Size mediaQuery;
final FlutterLocalization localization = FlutterLocalization.instance;
late SharedPreferences sharedPreferences;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await DatabaseHelper.database;
  await get_it.init();
  sharedPreferences = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    localization.init(
      mapLocales: [
        MapLocale(
          'en',
          AppLocale.en,
          countryCode: 'US',
        ),
        MapLocale(
          'ar',
          AppLocale.ar,
          countryCode: 'DZ',
        ),
      ],
      initLanguageCode: 'ar',
    );
    localization.onTranslatedLanguage = _onTranslatedLanguage;
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  bool isCon = false;

  // Future<void> isConnected() async {
  //   Networkinfo networkinfo =
  //       NetworkinfoImpl(netCheck: InternetConnectionChecker());
  //   if (await networkinfo.isConnected == true) {
  //     isCon = true;
  //   } else {
  //     isCon = false;
  //   }
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // isConnected();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ThemeBloc()..add(GetCurrentThemeEvent())),
        BlocProvider(create: (context) => SigninCubit(DioConsumer(dio: Dio()))),
        BlocProvider(
            create: (context) => ProfileCubit(DioConsumer(dio: Dio()))),
        BlocProvider(
            create: (context) => OrderBloc(
                getAllOrderComUC: get_it.sl(), getAllOrderPenUC: get_it.sl())),
        BlocProvider(create: (context) => DoneCubit(DioConsumer(dio: Dio()))),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
        if (state is LoadedThemeState) {
          return MaterialApp(
              navigatorKey: navigatorKey,
              supportedLocales: localization.supportedLocales,
              localizationsDelegates: localization.localizationsDelegates,
              debugShowCheckedModeBanner: false,
              theme: state.themeData,
              home: SigninPage());
        } else {
          return const SizedBox.shrink();
        }
      }),
    );
  }
}