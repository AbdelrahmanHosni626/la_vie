import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/models/register/register_model.dart';
import 'package:la_vie/modules/register/cubit/states.dart';
import 'package:la_vie/shared/network/end_points.dart';

import '../../../shared/network/remote/dio_helper.dart';

class RegisterCubit extends Cubit<RegisterStates>
{
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);




  late RegisterModel registerModel;

  void userRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  })
  {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data:
      {
        'firstName' : firstName,
        'lastName' : lastName,
        'email' : email,
        'password' : password,
      },
    ).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      emit(RegisterSuccessState(registerModel));
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }



  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;


  void changePasswordVisibility()
  {
    isPassword = ! isPassword;
    suffix = isPassword? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(RegisterChangePasswordVisibilityState());
  }
}