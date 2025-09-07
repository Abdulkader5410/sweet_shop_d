import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sweet_shop_d/core/app_language/app_locale.dart';
import 'package:sweet_shop_d/core/app_theme/app_theme.dart';
import 'package:sweet_shop_d/core/utilities/snakBar.dart';
import 'package:sweet_shop_d/features/profile/cubit/profile%20cubit/profile_state.dart';

import '../../../main.dart';
import '../cubit/profile cubit/profile_cubit.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double op = 0;
  bool isEdited = false;

  @override
  void initState() {
    super.initState();
    if (!isEdited) {
      context.read<ProfileCubit>().getProfile();
    }
  }

  void _fadeOp() {
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        setState(() {
          op = 1;
        });
      },
    );
  }

  void _unFadeOp() {
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        setState(() {
          op = 0;
        });
      },
    );
  }

  bool isReadOnly = true;
  bool isDarkTheme = true;

  Future<void> checkPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.photos,
    ].request();
    if (!(statuses[Permission.camera] != PermissionStatus.granted ||
        statuses[Permission.phone] != PermissionStatus.granted)) {
      ShowSnakBar()
          .ErrorSnakBar(context: context, message: "Permission denied");
    } else {
      pickedImageFromGallery();
    }
  }

  File? currImage;
  pickedImageFromGallery() async {
    try {
      // final pickedImage =
      //     await ImagePicker().pickImage(source: ImageSource.gallery);
      // if (pickedImage != null) {
      //   setState(() {
      //     currImage = File(pickedImage.path);
      //   });
      // }

    } catch (ex) {
      ShowSnakBar().ErrorSnakBar(
          context: context, message: AppLocale.get(AppLocale.notSelectPhoto));
    }
  }

  @override
  Widget build(BuildContext context) {
    isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Directionality(
      textDirection: localization.currentLocale!.languageCode == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          toolbarHeight: 50,
          automaticallyImplyLeading: false,
          title: Text(AppLocale.get(AppLocale.profile),
              style: Theme.of(context).textTheme.titleMedium),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    if (isReadOnly) {
                      isReadOnly = false;
                      _fadeOp();
                    } else {
                      isReadOnly = true;
                      _unFadeOp();
                    }
                  });
                },
                icon: const Icon(
                  Icons.edit_outlined,
                  size: 25,
                )),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: darkPrimaryColor,
                  strokeWidth: 1,
                ),
              );
            } else if (state is ProfileFailure) {
              return Center(
                child: Text("Unexpected error ouccured !",
                    style: Theme.of(context).textTheme.displayLarge),
              );
            } else if (state is ProfileLoaded) {
              return Container(
                  padding: const EdgeInsets.only(
                      bottom: 16, left: 16, right: 16, top: 22),
                  child: SingleChildScrollView(
                    child: Form(
                      key: context.read<ProfileCubit>().proForm,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 160,
                            height: 160,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  left: 0,
                                  child: Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: const BoxDecoration(),
                                      width: 160,
                                      height: 160,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(500),
                                        child: Container(
                                            child: currImage != null
                                                ? Image.file(
                                                    File(currImage!.path),
                                                    fit: BoxFit.cover,
                                                  )
                                                : Image.asset(
                                                    "assets/images/profile_photo.jpg")),
                                      )),
                                ),
                                Positioned(
                                  bottom: 5,
                                  right: 5,
                                  child: CircleAvatar(
                                    backgroundColor: lightColor,
                                    child: IconButton(
                                        onPressed: () {
                                          checkPermission();
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: isReadOnly
                                              ? greyColor
                                              : darkPrimaryColor,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                              height: 80,
                              decoration: BoxDecoration(
                                  color: isDarkTheme
                                      ? darkPrimaryColor
                                      : lightPrimaryColor,
                                  borderRadius: BorderRadius.circular(12)),
                              child: ListTile(
                                title: Text(
                                  AppLocale.get(AppLocale.name),
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                                subtitle: GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: SizedBox(
                                      height: 40,
                                      child: TextFormField(
                                        textAlignVertical:
                                            TextAlignVertical.bottom,
                                        onSaved: (val) {},
                                        validator: (value) {
                                          if (value!.length < 3) {
                                            return AppLocale.get(
                                                AppLocale.waringName);
                                          }
                                          return null;
                                        },
                                        controller: context
                                            .read<ProfileCubit>()
                                            .nameCon,
                                        readOnly: isReadOnly,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                        decoration: InputDecoration(
                                            hintStyle: Theme.of(context)
                                                .textTheme
                                                .displayMedium!
                                                .copyWith(
                                                  color: isReadOnly
                                                      ? greyColor
                                                      : darkPrimaryColor,
                                                ),
                                            hintText:
                                                state.profileModel.doc.name),
                                      ),
                                    ),
                                  ),
                                ),
                                leading: SizedBox(
                                  width: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.person_outline,
                                        color: primaryColor,
                                      ),
                                      Container(
                                          width: 2,
                                          height: 100,
                                          color: darkPrimaryColor)
                                    ],
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 80,
                              decoration: BoxDecoration(
                                  color: isDarkTheme
                                      ? darkPrimaryColor
                                      : lightPrimaryColor,
                                  borderRadius: BorderRadius.circular(12)),
                              child: ListTile(
                                leading: SizedBox(
                                  width: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.email_outlined,
                                        color: primaryColor,
                                      ),
                                      Container(
                                          width: 2,
                                          height: 100,
                                          color: darkPrimaryColor)
                                    ],
                                  ),
                                ),
                                title: Text(
                                  AppLocale.get(AppLocale.email),
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                                subtitle: GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: SizedBox(
                                      height: 40,
                                      child: TextFormField(
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                        onSaved: (value) {},
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return AppLocale.get(
                                                AppLocale.waringEmail);
                                          } else if (!emailRegExp
                                              .hasMatch(value)) {
                                            return AppLocale.get(
                                                AppLocale.notTrueEmail);
                                          }
                                          return null;
                                        },
                                        controller: context
                                            .read<ProfileCubit>()
                                            .emailCon,
                                        readOnly: isReadOnly,
                                        textAlignVertical:
                                            TextAlignVertical.bottom,
                                        decoration: InputDecoration(
                                            hintStyle: Theme.of(context)
                                                .textTheme
                                                .displayMedium!
                                                .copyWith(
                                                  color: isReadOnly
                                                      ? greyColor
                                                      : darkPrimaryColor,
                                                ),
                                            hintText:
                                                state.profileModel.doc.email),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 80,
                              decoration: BoxDecoration(
                                  color: isDarkTheme
                                      ? darkPrimaryColor
                                      : lightPrimaryColor,
                                  borderRadius: BorderRadius.circular(12)),
                              child: ListTile(
                                leading: SizedBox(
                                  width: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.phone_outlined,
                                        color: primaryColor,
                                      ),
                                      Container(
                                          width: 2,
                                          height: 100,
                                          color: darkPrimaryColor)
                                    ],
                                  ),
                                ),
                                title: Text(
                                  AppLocale.get(AppLocale.phone),
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                                subtitle: GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: SizedBox(
                                      height: 40,
                                      child: TextFormField(
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                        controller: context
                                            .read<ProfileCubit>()
                                            .phoneCon,
                                        readOnly: isReadOnly,
                                        textAlignVertical:
                                            TextAlignVertical.bottom,
                                        decoration: InputDecoration(
                                            hintStyle: Theme.of(context)
                                                .textTheme
                                                .displayMedium!
                                                .copyWith(
                                                  color: isReadOnly
                                                      ? greyColor
                                                      : darkPrimaryColor,
                                                ),
                                            hintText:
                                                state.profileModel.doc.phone),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: 50,
                          ),
                          isReadOnly
                              ? const SizedBox()
                              : AnimatedOpacity(
                                  duration: const Duration(seconds: 1),
                                  opacity: op,
                                  child: SizedBox(
                                      height: 50,
                                      width: MediaQuery.sizeOf(context).width,
                                      child: ElevatedButton(
                                        style: const ButtonStyle(
                                            shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                12)))),
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    primaryColor)),
                                        onPressed: () async {
                                          context
                                              .read<ProfileCubit>()
                                              .updateProfile();

                                          // if (context
                                          //         .read<ProfileCubit>()
                                          //         .currPassCon
                                          //         .text
                                          //         .isNotEmpty &&
                                          //     context
                                          //         .read<ProfileCubit>()
                                          //         .newPassCon
                                          //         .text
                                          //         .isNotEmpty) {
                                          //   context
                                          //       .read<ProfileCubit>()
                                          //       .updatePassword();
                                          // }
                                        },
                                        child: Text(
                                          AppLocale.get(AppLocale.save),
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge!
                                              .copyWith(color: lightColor),
                                        ),
                                      )),
                                ),
                        ],
                      ),
                    ),
                  ));
            } else if (state is ProfileUpdated) {
              return Container(
                  padding: const EdgeInsets.only(
                      bottom: 16, left: 16, right: 16, top: 22),
                  child: SingleChildScrollView(
                    child: Form(
                      key: context.read<ProfileCubit>().proForm,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(),
                              width: 160,
                              height: 160,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(500),
                                child: Container(
                                    child: Image.asset(
                                        "assets/images/profile_photo.jpg")),
                              )),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                              height: 70,
                              decoration: BoxDecoration(
                                  color: darkPrimaryColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12)),
                              child: ListTile(
                                title: Text(
                                  AppLocale.get(AppLocale.name),
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                                subtitle: GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: SizedBox(
                                      height: 30,
                                      child: TextFormField(
                                        onSaved: (val) {},
                                        validator: (value) {
                                          if (value!.length < 3) {
                                            AppLocale.get(AppLocale.waringName);
                                          }
                                          return null;
                                        },
                                        controller: context
                                            .read<ProfileCubit>()
                                            .nameCon,
                                        readOnly: isReadOnly,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintStyle: Theme.of(context)
                                                .textTheme
                                                .displayMedium!
                                                .copyWith(
                                                  color: isReadOnly
                                                      ? greyColor
                                                      : darkPrimaryColor,
                                                ),
                                            hintText: state
                                                .proResModel.data.pro.name),
                                      ),
                                    ),
                                  ),
                                ),
                                leading: SizedBox(
                                  width: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.person_outline,
                                        size: 25,
                                      ),
                                      Container(
                                        width: 2,
                                        height: 100,
                                        color: darkPrimaryColor,
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: darkPrimaryColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12)),
                              child: ListTile(
                                leading: SizedBox(
                                  width: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.email_outlined,
                                        color: primaryColor,
                                        size: 25,
                                      ),
                                      Container(
                                          width: 2,
                                          height: 100,
                                          color: darkPrimaryColor)
                                    ],
                                  ),
                                ),
                                title: Text(
                                  AppLocale.get(AppLocale.email),
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                                subtitle: GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: SizedBox(
                                      height: 30,
                                      child: TextFormField(
                                        onSaved: (value) {},
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return AppLocale.get(
                                                AppLocale.waringEmail);
                                          } else if (!emailRegExp
                                              .hasMatch(value)) {
                                            return AppLocale.get(
                                                AppLocale.notTrueEmail);
                                          }
                                          return null;
                                        },
                                        controller: context
                                            .read<ProfileCubit>()
                                            .emailCon,
                                        readOnly: isReadOnly,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintStyle: Theme.of(context)
                                                .textTheme
                                                .displayMedium!
                                                .copyWith(
                                                  color: isReadOnly
                                                      ? greyColor
                                                      : darkPrimaryColor,
                                                ),
                                            hintText: state
                                                .proResModel.data.pro.email),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 70,
                              decoration: BoxDecoration(
                                  color: darkPrimaryColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12)),
                              child: ListTile(
                                leading: SizedBox(
                                  width: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.phone_outlined,
                                        color: primaryColor,
                                        size: 25,
                                      ),
                                      Container(
                                          width: 2,
                                          height: 100,
                                          color: darkPrimaryColor)
                                    ],
                                  ),
                                ),
                                title: Text(
                                  AppLocale.get(AppLocale.phone),
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                                subtitle: GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: SizedBox(
                                      height: 30,
                                      child: TextFormField(
                                        controller: context
                                            .read<ProfileCubit>()
                                            .phoneCon,
                                        readOnly: isReadOnly,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintStyle: Theme.of(context)
                                                .textTheme
                                                .displayMedium!
                                                .copyWith(
                                                  color: isReadOnly
                                                      ? greyColor
                                                      : darkPrimaryColor,
                                                ),
                                            hintText: state
                                                .proResModel.data.pro.phone),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: 50,
                          ),
                          isReadOnly
                              ? const SizedBox()
                              : AnimatedOpacity(
                                  duration: const Duration(seconds: 1),
                                  opacity: op,
                                  child: SizedBox(
                                      height: 50,
                                      width: MediaQuery.sizeOf(context).width,
                                      child: ElevatedButton(
                                        style: const ButtonStyle(
                                            shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                12)))),
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    primaryColor)),
                                        onPressed: () async {
                                          context
                                              .read<ProfileCubit>()
                                              .updateProfile();
                                          isEdited = true;
                                          isReadOnly = true;
                                          // if (context
                                          //         .read<ProfileCubit>()
                                          //         .currPassCon
                                          //         .text
                                          //         .isNotEmpty &&
                                          //     context
                                          //         .read<ProfileCubit>()
                                          //         .newPassCon
                                          //         .text
                                          //         .isNotEmpty) {
                                          //   context
                                          //       .read<ProfileCubit>()
                                          //       .updatePassword();
                                          // }
                                        },
                                        child: Text(
                                          AppLocale.get(AppLocale.save),
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge!
                                              .copyWith(color: lightColor),
                                        ),
                                      )),
                                ),
                        ],
                      ),
                    ),
                  ));
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
