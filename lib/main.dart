import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/layout/cubit/cubit.dart';
import 'package:la_vie/layout/cubit/states.dart';
import 'package:la_vie/modules/login/login_screen.dart';
import 'package:la_vie/shared/bloc_observe.dart';
import 'package:la_vie/shared/components/constant.dart';
import 'package:la_vie/shared/network/local/cache_helper.dart';
import 'package:la_vie/shared/styles/themes.dart';
import 'package:la_vie/shared/network/remote/dio_helper.dart';
import 'layout/home_layout.dart';
import 'modules/plants/plants_screen.dart';
import 'modules/products/products_screen.dart';
import 'modules/splash/spalsh_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  DioHelper.init();
  await CacheHelper.init();

  accessToken = CacheHelper.getData(key: 'accessToken');
  print('accessToken: $accessToken Bishooooo');

  Widget? widget;

  if (accessToken != null) {
    widget = SplashScreen(
      widget: HomeLayoutScreen(),
    );
  } else {
    widget = SplashScreen(
      widget: LoginScreen(),
    );
  }

  runApp( MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {

  final Widget? startWidget;

  MyApp({
this.startWidget
});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LavieCubit()..getProductsData()..getPlantsData()..getSeedsData()..getToolsData(),
      child: BlocConsumer<LavieCubit, LavieStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          return MaterialApp(
            theme: lightTheme,
            debugShowCheckedModeBanner: false,
            home: startWidget,
          );
        },
      ),
    );
  }
}
