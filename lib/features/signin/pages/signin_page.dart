import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweet_shop_d/core/app_language/app_locale.dart';
import 'package:sweet_shop_d/core/app_theme/app_theme.dart';
import 'package:sweet_shop_d/core/utilities/snakBar.dart';
import 'package:sweet_shop_d/features/order/presentation/ui/screens/all_orders_page.dart';
import 'package:sweet_shop_d/features/signin/cubit/signin%20cubit/signin_cubit.dart';
import 'package:sweet_shop_d/features/signin/cubit/signin%20cubit/signin_state.dart';
import 'package:sweet_shop_d/main.dart';
import '../../../core/utilities/pass_cubit.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  Pass passCuibt = Pass();
  late String phoneNumber;

  //this variables to animte title
  String _displayText = "";
  String text = AppLocale.get(AppLocale.titleSignin);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300));
    _startTyping();
  }

  @override
  void dispose() {
    _timer!.cancel();

    super.dispose();
  }

  //this fun to typnig title with animation
  void _startTyping() {
    _timer = Timer.periodic(const Duration(milliseconds: 125), (timer) {
      if (!mounted) return;
      setState(() {
        if (_displayText.length < text.length) {
          _displayText += text[_displayText.length];
        } else if (_displayText.length == text.length) {
          _fadeOp();
        } else {
          _timer!.cancel();
        }
      });
    });
  }

  //this variable to apply fade animtiion on screen
  double _op = 0;

  //this fun to apply fade animtiion on screen
  void _fadeOp() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (!mounted) return;

        setState(() {
          _op = 1;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: localization.currentLocale!.languageCode == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          toolbarHeight: 50,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ),
        body: BlocConsumer<SigninCubit, SigninState>(
          listener: (context, state) {
            if (state is SigninSuccess) {
              ShowSnakBar().MessageSnakBar(
                context: context,
                message: AppLocale.get(AppLocale.signinSuccess),
              );
              Future.delayed(const Duration(milliseconds: 700), () {
                if (mounted) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => AllOrdersPage()));
                }
              });
            } else if (state is SigninFailure) {
              ShowSnakBar().ErrorSnakBar(
                  context: context, message: state.errMsg.toString());
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    _displayText,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AnimatedOpacity(
                    duration: const Duration(seconds: 1),
                    opacity: _op,
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 1.6,
                          child: Text("سجل دوخلك وقم بتوصيل الطلبات بسهولة",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(color: greyColor)),
                        ),
                        const SizedBox(
                          height: 80,
                        ),

                        SizedBox(
                          height: 270,
                          child: Form(
                            key: context.read<SigninCubit>().siginForm,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 80,
                                  width: 300,
                                  child: TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                    onSaved: (value) {},
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return AppLocale.get(
                                            AppLocale.waringEmail);
                                      } else if (!emailRegExp.hasMatch(value)) {
                                        return AppLocale.get(
                                            AppLocale.notTrueEmail);
                                      }
                                      return null;
                                    },
                                    controller: context
                                        .read<SigninCubit>()
                                        .emailController,
                                    cursorHeight: 25,
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      errorStyle: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(color: Colors.red),
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                      iconColor: primaryColor,
                                      prefixIcon: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Icon(
                                          Icons.email_outlined,
                                          color: primaryColor,
                                        ),
                                      ),
                                      hintText: AppLocale.get(AppLocale.email),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                BlocBuilder<Pass, bool>(
                                  bloc: passCuibt,
                                  builder: (context, state) {
                                    return SizedBox(
                                      height: 80,
                                      width: 300,
                                      child: TextFormField(
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        onSaved: (val) {},
                                        validator: (value) {
                                          if (value!.length < 8) {
                                            return AppLocale.get(
                                                AppLocale.waringPass);
                                          }
                                          return null;
                                        },
                                        obscureText: state,
                                        controller: context
                                            .read<SigninCubit>()
                                            .passController,
                                        cursorColor: primaryColor,
                                        cursorHeight: 25,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        decoration: InputDecoration(
                                          errorStyle: Theme.of(context)
                                              .textTheme
                                              .displaySmall!
                                              .copyWith(
                                                color: Colors.red.shade700,
                                              ),
                                          hintText:
                                              AppLocale.get(AppLocale.password),
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .displayMedium!,
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              passCuibt.togglePass();
                                            },
                                            icon: Icon(
                                              size: 20,
                                              color: primaryColor,
                                              state
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                            ),
                                          ),
                                          prefixIcon: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Icon(
                                              Icons.password_rounded,
                                              color: primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),

                        // const Text("First Name"),
                        const SizedBox(
                          height: 80,
                        ),
                        SizedBox(
                            height: 55,
                            width: 300,
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)))),
                                  backgroundColor:
                                      MaterialStatePropertyAll(primaryColor)),
                              onPressed: () async {
                                context.read<SigninCubit>().signin();
                              },
                              child: BlocBuilder<SigninCubit, SigninState>(
                                builder: (context, state) {
                                  if (state is SigninLoading) {
                                    return const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.black,
                                        strokeWidth: 2,
                                      ),
                                    );
                                  }
                                  return Text(
                                    AppLocale.get(AppLocale.signin),
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(color: lightColor),
                                  );
                                },
                              ),
                            )),

                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
          },
        ),
      ),
    );
  }
}
