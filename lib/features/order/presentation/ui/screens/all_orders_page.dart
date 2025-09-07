import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sweet_shop_d/core/api/dio_consumer.dart';
import 'package:sweet_shop_d/core/api/endpoints.dart';
import 'package:sweet_shop_d/core/app_language/app_locale.dart';
import 'package:sweet_shop_d/core/app_theme/app_theme.dart';
import 'package:sweet_shop_d/core/utilities/snakBar.dart';
import 'package:sweet_shop_d/features/order/data/model/order_model.dart';
import 'package:sweet_shop_d/features/order/presentation/bloc/order%20bloc/order_bloc.dart';
import 'package:sweet_shop_d/features/order/presentation/bloc/order%20bloc/order_event.dart';
import 'package:sweet_shop_d/features/order/presentation/bloc/order%20bloc/order_state1.dart';
import 'package:sweet_shop_d/features/order/presentation/done%20cubit/done_cubit.dart';
import 'package:sweet_shop_d/main.dart';

late bool isDark;

class AllOrdersPage extends StatefulWidget {
  const AllOrdersPage({
    super.key,
  });

  @override
  State<AllOrdersPage> createState() => _AllOrdersPageState();
}

class _AllOrdersPageState extends State<AllOrdersPage> {
  Future<dynamic> getPoint(String idLoc) async {
    dynamic loc = await Dio()
        .get("https://sweet-shop-main.vercel.app/api/v1.0.0/locations/$idLoc");
    if (loc.toString().contains("long")) {
      return loc;
    }
  }

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    context.read<OrderBloc>().add(const GetAllOrderPenEvent());

    mediaQuery = MediaQuery.sizeOf(context);

    final isAr = localization.currentLocale!.languageCode == 'ar';
    isDark = Theme.of(context).brightness == Brightness.dark;

    return Directionality(
        textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocale.get(AppLocale.orders),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 150,
                    child: MaterialButton(
                        color: Colors.blue[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        onPressed: () {
                          context
                              .read<OrderBloc>()
                              .add(const GetAllOrderPenEvent());
                          pageController.animateToPage(0,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.fastOutSlowIn);
                        },
                        child: Text(AppLocale.get(AppLocale.needDelivery),
                            style: Theme.of(context).textTheme.displayMedium)),
                  ),
                  SizedBox(
                    width: 150,
                    child: MaterialButton(
                        color: Colors.green[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        onPressed: () {
                          context.read<OrderBloc>().add(GetAllOrderComEvent(
                              driverId:
                                  sharedPreferences.getString("currentUser")!,
                              st: ""));

                          pageController.animateToPage(1,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.fastOutSlowIn);
                        },
                        child: Text(AppLocale.get(AppLocale.finish),
                            style: Theme.of(context).textTheme.displayMedium)),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return orderPage(index, context);
                  },
                ),
              )
            ],
          ),
        ));
  }
}

Widget orderPage(int index, BuildContext context) {
  isDark = Theme.of(context).brightness == Brightness.dark;

  Future<dynamic> getLoc(String id) async {
    try {
      dynamic response = await DioConsumer(dio: Dio())
          .get(EndPoints.baseUrl + EndPoints.location + id);

      return response;
    } catch (e) {}
  }

  return index == 1
      //complete order
      ? BlocBuilder<OrderBloc, OrderState1>(
          builder: (context, state) {
            if (state is LoadingOrderComState1) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ErrorOrderComState1) {
              return const SizedBox.shrink();
            } else if (state is LoadedOrderComState1) {
              return SizedBox(
                height: 600,
                child: ListView.builder(
                    itemCount: state.orders!.results,
                    itemBuilder: (context, index) {
                      dynamic x;
                      DocOrder? d;
                      state.orders!.doc![index].status['en'] == "Completed"
                          ? d = state.orders!.doc![index]
                          : x = state.orders!.doc![index];

                      return d == null
                          ? const SizedBox.shrink()
                          : Container(
                              margin: const EdgeInsets.all(16),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: lightPrimaryColor,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                children: [
                                  Text(
                                    "# ${d.id.substring(16, 24)}",
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "${AppLocale.get(ApiKey.phone)} ${d.user['phone'].toString()}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  FutureBuilder(
                                      future: getLoc(d.location),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const CircularProgressIndicator(
                                            strokeWidth: 1,
                                          );
                                        } else if (snapshot.hasData) {
                                          return SizedBox(
                                            height: 200,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: FlutterMap(
                                                options: MapOptions(
                                                  keepAlive: true,
                                                  initialCenter: LatLng(
                                                    snapshot.data['doc']
                                                        ['Latitude'],
                                                    snapshot.data['doc']
                                                        ['Longitude'],
                                                  ),
                                                  initialZoom: 5.5,
                                                ),
                                                children: [
                                                  TileLayer(
                                                    errorImage:
                                                        const AssetImage(
                                                      "assets/images/syria.png",
                                                    ),
                                                    urlTemplate:
                                                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                                    userAgentPackageName:
                                                        ' com.example.sweet_shop_d',
                                                  ),
                                                  MarkerLayer(markers: [
                                                    Marker(
                                                        point: LatLng(
                                                          snapshot.data['doc']
                                                              ['Latitude'],
                                                          snapshot.data['doc']
                                                              ['Longitude'],
                                                        ),
                                                        child: const Icon(
                                                          Icons.location_on,
                                                          color: Colors.red,
                                                        ))
                                                  ])
                                                ],
                                              ),
                                            ),
                                          );
                                        } else {
                                          return const SizedBox.shrink();
                                        }
                                      }),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 150,
                                    child: SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Table(
                                          border: TableBorder.all(
                                              width: 1,
                                              color: isDark
                                                  ? lightPrimaryColor
                                                      .withOpacity(0.5)
                                                  : darkPrimaryColor
                                                      .withOpacity(0.5),
                                              style: BorderStyle.solid),
                                          children: [
                                            ...List.generate(d.cart.length + 1,
                                                (cartIndex) {
                                              print(
                                                  "LOC >>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ${d!.location}");

                                              print('''  cartINDEX
                                                              $cartIndex ''');

                                              return cartIndex == 0
                                                  ? TableRow(
                                                      decoration: BoxDecoration(
                                                          color: primaryColor
                                                              .withOpacity(
                                                                  0.25)),
                                                      children: [
                                                          TableCell(
                                                              child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4),
                                                            child: Text(
                                                              AppLocale.get(
                                                                  AppLocale
                                                                      .name),
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .displaySmall,
                                                            ),
                                                          )),
                                                          TableCell(
                                                              child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4),
                                                            child: Text(
                                                              AppLocale.get(
                                                                  AppLocale
                                                                      .price),
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .displaySmall,
                                                            ),
                                                          )),
                                                          TableCell(
                                                              child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4),
                                                            child: Text(
                                                              AppLocale.get(
                                                                  AppLocale
                                                                      .quntity),
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .displaySmall,
                                                            ),
                                                          )),
                                                          TableCell(
                                                              child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4),
                                                            child: Text(
                                                              AppLocale.get(
                                                                  AppLocale
                                                                      .totalPrice),
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .displaySmall,
                                                            ),
                                                          )),
                                                        ])
                                                  : TableRow(children: [
                                                      TableCell(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(4),
                                                          child: Text(
                                                            "${d.cart[cartIndex - 1]['product']['name']['ar']}",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .displaySmall,
                                                          ),
                                                        ),
                                                      ),
                                                      TableCell(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(4),
                                                          child: Text(
                                                            "${d.cart[cartIndex - 1]['price'] / d.cart[cartIndex - 1]['quantity']}",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .displaySmall,
                                                          ),
                                                        ),
                                                      ),
                                                      TableCell(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(4),
                                                          child: Text(
                                                            "${d.cart[cartIndex - 1]['quantity']}",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .displaySmall,
                                                          ),
                                                        ),
                                                      ),
                                                      TableCell(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(4),
                                                          child: Text(
                                                            "${d.cart[cartIndex - 1]['price']}",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .displaySmall,
                                                          ),
                                                        ),
                                                      ),
                                                    ]);
                                            })
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                    }),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        )
      //pending order
      : BlocBuilder<OrderBloc, OrderState1>(
          builder: (context, stateP) {
            if (stateP is LoadingOrderPenState1) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (stateP is ErrorOrderPenState1) {
              return const SizedBox.shrink();
            } else if (stateP is LoadedOrderPenState1) {
              return ListView.builder(
                  itemCount: stateP.orders!.results,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: lightPrimaryColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "# ${stateP.orders!.doc![index].id.substring(16, 24)}",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              BlocConsumer<DoneCubit, DoneState>(
                                listener: (context, stateDL) {
                                  if (stateDL is DoneSuccess) {
                                    ShowSnakBar().MessageSnakBar(
                                        context: context,
                                        message: "تم توصيل الطلب بنجاح");

                                    context
                                        .read<OrderBloc>()
                                        .add(const GetAllOrderPenEvent());
                                  } else if (stateDL is DoneError) {
                                    ShowSnakBar().MessageSnakBar(
                                        context: context,
                                        message: "حدث خطأ ما");
                                  }
                                },
                                builder: (context, stateDB) {
                                  return IconButton(
                                      color: primaryColor,
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.green)),
                                      onPressed: () {
                                        context.read<DoneCubit>().doneOrder(
                                            stateP.orders!.doc![index].id);
                                      },
                                      icon: const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ));
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${AppLocale.get(ApiKey.phone)} ${stateP.orders!.doc![index].user['phone'].toString()}",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: FutureBuilder(
                                future:
                                    getLoc(stateP.orders!.doc![index].location),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const CircularProgressIndicator();
                                  } else if (snapshot.hasData) {
                                    return SizedBox(
                                      height: 250,
                                      width: 250,
                                      child: FlutterMap(
                                        options: MapOptions(
                                          keepAlive: true,
                                          initialCenter: LatLng(
                                              snapshot.data['doc']['Latitude'],
                                              snapshot.data['doc']
                                                  ['Longitude']),
                                          initialZoom: 5.5,
                                        ),
                                        children: [
                                          TileLayer(
                                            errorImage: const AssetImage(
                                              "assets/images/syria.png",
                                            ),
                                            urlTemplate:
                                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                            userAgentPackageName:
                                                ' com.example.sweet_shop_d',
                                          ),
                                          MarkerLayer(markers: [
                                            Marker(
                                                point: LatLng(
                                                    snapshot.data['doc']
                                                        ['Latitude'],
                                                    snapshot.data['doc']
                                                        ['Longitude']),
                                                child: const Icon(
                                                  Icons.location_on,
                                                  color: Colors.red,
                                                ))
                                          ])
                                        ],
                                      ),
                                    );
                                  } else {
                                    return const SizedBox.shrink();
                                  }
                                }),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 150,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Table(
                                  border: TableBorder.all(
                                      width: 1,
                                      color: isDark
                                          ? lightPrimaryColor.withOpacity(0.5)
                                          : darkPrimaryColor.withOpacity(0.5),
                                      style: BorderStyle.solid),
                                  children: [
                                    ...List.generate(
                                        stateP.orders!.doc![index].cart.length +
                                            1, (cartIndex) {
                                      print('''  cartINDEX
                                                              ${cartIndex} ''');

                                      return cartIndex == 0
                                          ? TableRow(
                                              decoration: BoxDecoration(
                                                  color: primaryColor
                                                      .withOpacity(0.25)),
                                              children: [
                                                  TableCell(
                                                      child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(4),
                                                    child: Text(
                                                      AppLocale.get(
                                                          AppLocale.name),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displaySmall,
                                                    ),
                                                  )),
                                                  TableCell(
                                                      child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(4),
                                                    child: Text(
                                                      AppLocale.get(
                                                          AppLocale.price),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displaySmall,
                                                    ),
                                                  )),
                                                  TableCell(
                                                      child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(4),
                                                    child: Text(
                                                      AppLocale.get(
                                                          AppLocale.quntity),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displaySmall,
                                                    ),
                                                  )),
                                                  TableCell(
                                                      child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(4),
                                                    child: Text(
                                                      AppLocale.get(
                                                          AppLocale.totalPrice),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displaySmall,
                                                    ),
                                                  )),
                                                ])
                                          : TableRow(children: [
                                              TableCell(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  child: Text(
                                                    "${stateP.orders!.doc![index].cart[cartIndex - 1]['product']['name']['ar']}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displaySmall,
                                                  ),
                                                ),
                                              ),
                                              TableCell(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  child: Text(
                                                    "${stateP.orders!.doc![index].cart[cartIndex - 1]['price'] / stateP.orders!.doc![index].cart[cartIndex - 1]['quantity']}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displaySmall,
                                                  ),
                                                ),
                                              ),
                                              TableCell(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  child: Text(
                                                    "${stateP.orders!.doc![index].cart[cartIndex - 1]['quantity']}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displaySmall,
                                                  ),
                                                ),
                                              ),
                                              TableCell(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  child: Text(
                                                    "${stateP.orders!.doc![index].cart[cartIndex - 1]['price']}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displaySmall,
                                                  ),
                                                ),
                                              ),
                                            ]);
                                    })
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            } else {
              return const SizedBox.shrink();
            }
          },
        );
}
