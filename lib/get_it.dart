import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sweet_shop_d/core/api/dio_consumer.dart';
import 'package:sweet_shop_d/features/order/data/data_repo/order_data_repo.dart';
import 'package:sweet_shop_d/features/order/data/data_source/order_remote_data_source.dart';
import 'package:sweet_shop_d/features/order/domain/dom_repo/order_dom_repo.dart';
import 'package:sweet_shop_d/features/order/domain/usecase/get_all_order_com_usecase.dart';
import 'package:sweet_shop_d/features/order/domain/usecase/get_all_order_pen_usecase.dart';
import 'package:sweet_shop_d/features/order/presentation/bloc/order%20bloc/order_bloc.dart';
import 'package:sweet_shop_d/features/order/presentation/done%20cubit/done_cubit.dart';
import 'package:sweet_shop_d/features/profile/cubit/profile%20cubit/profile_cubit.dart';
import 'package:sweet_shop_d/features/signin/cubit/signin%20cubit/signin_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // bloc

  sl.registerFactory(() => SigninCubit(sl()));
  sl.registerFactory(() => ProfileCubit(sl()));
  sl.registerFactory(
      () => OrderBloc(getAllOrderComUC: sl(), getAllOrderPenUC: sl()));
  sl.registerFactory(() => DoneCubit(sl()));
  // sl.registerFactory(() => ProfileBloc(getUserProfileUC: sl()));
  // sl.registerFactory(() => ProductsBloc(getproductsUC: sl()));
  // sl.registerFactory(() => SignUpBloc(signUpUserUC: sl()));
  // sl.registerFactory(() => ProDetailsBloc(getProDetailsUC: sl()));

//usecase

  sl.registerFactory(() => GetAllOrdersComUC(ordersDomRepo: sl()));
  sl.registerFactory(() => GetAllOrdersPenUC(ordersDomRepo: sl()));
  // sl.registerFactory(() => DeleteAccountUC(userDomRepo: sl()));
  // sl.registerFactory(() => GetUserProfileUC(userDomRepo: sl()));

  // sl.registerFactory(() => GetAllCategUC(categDomRepo: sl()));
  // sl.registerFactory(() => GetOneCategeUC(categDomRepo: sl()));
  // sl.registerFactory(() => GetProdDetailsUC(prodDomRepo: sl()));
  // sl.registerFactory(() => GetAllProUC(prodDomRepo: sl()));
  // sl.registerFactory(() => GetTopProductsUC(categDomRepo: sl()));
  // sl.registerFactory(() => GetAllOrdersUC(ordersDomRepo: sl()));
  // sl.registerFactory(() => DeleteCategUC(categDomRepo: sl()));
  // sl.registerFactory(() => CreateCategUC(categDomRepo: sl()));
  // sl.registerFactory(() => UpdateCategUC(categDomRepo: sl()));

  // sl.registerFactory(() => GetProductsUC(progDomRepo: sl()));

  // sl.registerFactory(() => SignUpUserUC(signupDomRepo: sl()));

  // sl.registerFactory(() => GetProDetailsUC(proDetailsDomRepo: sl()));

  // sl.registerFactory(() => GetCartUC(cartDomRepo: sl()));

// //repo

  sl.registerFactory<OrderDomRepo>(() => OrderDataRepo(remoteDataSource: sl()));

  // sl.registerFactory<CategDomRepo>(
  //     () => CategDataRepo(networkinfo: sl(), remoteDataSource: sl()));
  //
  // sl.registerFactory<ProdDomRepo>(
  //     () => ProdDataRepo(networkinfo: sl(), remoteDataSource: sl()));
  //
  // sl.registerFactory<OrderDomRepo>(
  //     () => OrderDataRepo(networkinfo: sl(), remoteDataSource: sl()));

  // sl.registerFactory<ProductsDomRepo>(
  // () => ProductsDataRepo(networkinfo: sl(), remoteDataSource: sl()));

  // sl.registerFactory<SignUpDomRepo>(() => SignUpDataRepo(
  // networkinfo: sl(), remoteDataSource: sl(), localDataSource: sl()));

  // sl.registerFactory<ProDetailsDomRepo>(() => ProDetailsDataRepo(
  //       networkinfo: sl(),
  //       remoteDataSource: sl(),
  //     ));

  // sl.registerFactory<CartDomRepo>(() => CartDataRepo(
  //       networkinfo: sl(),
  //       remoteDataSource: sl(),
  //     ));

//   //datasource

  sl.registerFactory<DioConsumer>(() => DioConsumer(dio: sl()));

  sl.registerFactory<OrderRemoteDataSource>(
      () => OrderRemoteDataSourceImpl(dio: sl()));

  // sl.registerFactory<CategRemoteDataSource>(
  //     () => CategRemoteDataSourceImpl(dio: sl()));
  //
  // sl.registerFactory<ProdRemoteDataSource>(
  //     () => ProdRemoteDataSourceeImpl(dio: sl()));
  //
  // sl.registerFactory<OrderRemoteDataSource>(
  //     () => OrderRemoteDataSourceImpl(dio: sl()));

  // sl.registerFactory<UserLocalDataSource>(
  // () => UserLocalDataSourceImpl(sp: sl()));

  // sl.registerFactory<ProductsRemoteDataSource>(
  //     () => ProductsRemoteDataSourceImpl(dio: sl()));

  // sl.registerFactory<SignUpRemoteDataSource>(
  //     () => SignUpRemoteDataSourceImpl(dio: sl()));

  // sl.registerFactory<SignUpLocalDataSource>(
  //     () => SignUpLocalDataSourceImpl(sp: sl()));

  // sl.registerFactory<ProDetailsRemoteDataSource>(
  // () => ProDetailsRemoteDataSourceImpl(dio: sl()));

  // sl.registerFactory<CartRemoteDataSource>(
  // () => CartRemoteDataSourceImpl(dio: sl()));

//   //// core

  // sl.registerFactory<Networkinfo>(() => NetworkinfoImpl(netCheck: sl()));

  // external

  SharedPreferences sp = await SharedPreferences.getInstance();
  sl.registerFactory(() => sp);

  // sl.registerFactory(() => InternetConnectionChecker());

  sl.registerFactory(() => Dio());
}
