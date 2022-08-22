import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/layout/cubit/states.dart';
import 'package:la_vie/models/products/plants_model.dart';
import 'package:la_vie/models/products/products_model.dart';
import 'package:la_vie/models/products/tools_model.dart';
import 'package:la_vie/modules/products/products_screen.dart';
import 'package:la_vie/modules/leaf/leaf_screen.dart';
import 'package:la_vie/modules/notification/notification_screen.dart';
import 'package:la_vie/modules/profile/profile_screen.dart';
import 'package:la_vie/modules/qr_scan/qr_scan_screen.dart';
import 'package:la_vie/shared/components/constant.dart';
import 'package:la_vie/shared/network/remote/dio_helper.dart';

import '../../models/products/seeds_model.dart';
import '../../shared/network/end_points.dart';

class LavieCubit extends Cubit<LavieStates> {
  LavieCubit() : super(InitialLavieStates());

  static LavieCubit get(context) => BlocProvider.of(context);

  int currentIndex = 2;

  List<Widget> bottomScreens = [
    LeafScreen(),
    QrScanCodeScreen(),
    ProductsScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(LavieChangeBottomNavState());
  }

  ProductsModel? productsModel;

  void getProductsData() {

    emit(GetProductsDataLoadingState());

    DioHelper.getData(
      url: PRODUCTS,
      accessToken: accessToken,
    ).then((value) {

      productsModel = ProductsModel.fromJson(value.data);

      print(productsModel!.type);
      print(productsModel!.message);

      emit(GetProductsDataSuccessState());
    }).catchError((error) {

      emit(GetProductsDataErrorState());
    });

  }

  PlantsModel? plantsModel;

  void getPlantsData() {
    emit(GetPlantsDataLoadingState());

    DioHelper.getData(
      url: PLANTS,
      accessToken: accessToken,
    )
        .then((value) {
              plantsModel = PlantsModel.fromJson(value.data);
              print(plantsModel!.type);
              print(plantsModel!.message);
      emit(GetPlantsDataSuccessState());
            })
        .catchError((error) {
      emit(GetPlantsDataErrorState());
    });
  }


  SeedsModel? seedsModel;

  void getSeedsData() {
    emit(GetSeedsDataLoadingState());

    DioHelper.getData(
      url: SEEDS,
      accessToken: accessToken,
    )
        .then((value) {
      seedsModel = SeedsModel.fromJson(value.data);
      print(plantsModel!.type);
      print(plantsModel!.message);
      emit(GetSeedsDataSuccessState());
    })
        .catchError((error) {
      emit(GetSeedsDataErrorState());
    });
  }


  ToolsModel? toolsModel;

  void getToolsData() {
    emit(GetToolsDataLoadingState());

    DioHelper.getData(
      url: TOOLS,
      accessToken: accessToken,
    )
        .then((value) {
      toolsModel = ToolsModel.fromJson(value.data);
      print(toolsModel!.type);
      print(toolsModel!.message);
      emit(GetToolsDataSuccessState());
    })
        .catchError((error) {
      emit(GetToolsDataErrorState());
    });
  }
}
