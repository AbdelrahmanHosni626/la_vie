import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_vie/layout/home_layout.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constant.dart';
import '../../shared/network/local/cache_helper.dart';
import '../login/login_screen.dart';
import '../web_view/web_view_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class RegisterScreen extends StatelessWidget {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (BuildContext context, state) {
          if (state is RegisterSuccessState) {
            if (state.registerModel.type != null) {
              print(state.registerModel.message);
              print('Token: ${state.registerModel.data!.accessToken}');

              CacheHelper.saveData(
                key: 'accessToken',
                value: state.registerModel.data!.accessToken,
              ).then((value) {
                accessToken = state.registerModel.data!.accessToken;

                navigateAndFinish(context, HomeLayoutScreen());
                showToast(
                  text: state.registerModel.message!,
                  state: ToastStates.SUCCESS,
                );
              });
            } else {
              print(state.registerModel.message);

              showToast(
                text: state.registerModel.message!,
                state: ToastStates.ERROR,
              );
            }
          }
        },
        builder: (BuildContext context, Object? state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Align(
                        alignment: Alignment.topRight,
                        child: Image(
                          image: AssetImage('assets/images/login.jpg'),
                        ),
                      ),
                      lavieLogo(),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Stack(
                          children: [
                            Stack(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                width: 2.0,
                                                color: HexColor('#1ABC00'),
                                              ),
                                            ),
                                          ),
                                          child: TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Sign up',
                                              style: TextStyle(
                                                color: HexColor('#1ABC00'),
                                                fontSize: 18.0,
                                                fontFamily: 'roboto',
                                              ),
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            navigateAndFinish(
                                                context, LoginScreen());
                                          },
                                          child: const Text(
                                            'Login',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18.0,
                                              fontFamily: 'roboto',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    const Align(
                                      alignment: Alignment.topLeft,
                                      child: Text('First Name'),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    defaultFormField(
                                      controller: emailController,
                                      type: TextInputType.emailAddress,
                                      prefix: Icons.email_outlined,
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your email address';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    const Align(
                                      alignment: Alignment.topLeft,
                                      child: Text('Last Name'),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    defaultFormField(
                                      controller: emailController,
                                      type: TextInputType.emailAddress,
                                      prefix: Icons.email_outlined,
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your email address';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    const Align(
                                      alignment: Alignment.topLeft,
                                      child: Text('Email'),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    defaultFormField(
                                      controller: emailController,
                                      type: TextInputType.emailAddress,
                                      prefix: Icons.email_outlined,
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your email address';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    const Align(
                                      alignment: Alignment.topLeft,
                                      child: Text('Password'),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    defaultFormField(
                                      controller: passwordController,
                                      type: TextInputType.visiblePassword,
                                      isPassword:
                                          RegisterCubit.get(context).isPassword,
                                      prefix: Icons.lock_outline,
                                      suffix: RegisterCubit.get(context).suffix,
                                      suffixPressed: () {
                                        RegisterCubit.get(context)
                                            .changePasswordVisibility();
                                      },
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your Password';
                                        }
                                        return null;
                                      },
                                      onSubmit: (value) {
                                        if (formKey.currentState!.validate()) {
                                          RegisterCubit.get(context).userRegister(
                                            firstName: firstNameController.text,
                                            lastName: lastNameController.text,
                                            email: emailController.text,
                                            password: passwordController.text,
                                          );
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    const Align(
                                      alignment: Alignment.topLeft,
                                      child: Text('Confirm Password'),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    defaultFormField(
                                      controller: passwordController,
                                      type: TextInputType.visiblePassword,
                                      isPassword:
                                      RegisterCubit.get(context).isPassword,
                                      prefix: Icons.lock_outline,
                                      suffix: RegisterCubit.get(context).suffix,
                                      suffixPressed: () {
                                        RegisterCubit.get(context)
                                            .changePasswordVisibility();
                                      },
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Please Confirm Your Password';
                                        }
                                        return null;
                                      },
                                      onSubmit: (value) {
                                        if (formKey.currentState!.validate()) {
                                          RegisterCubit.get(context).userRegister(
                                            firstName: firstNameController.text,
                                            lastName: lastNameController.text,
                                            email: emailController.text,
                                            password: passwordController.text,
                                          );
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 30.0,
                                    ),
                                    ConditionalBuilder(
                                      condition: state is! RegisterLoadingState,
                                      builder: (BuildContext context) =>
                                          Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          color: Colors.green,
                                        ),
                                        child: MaterialButton(
                                          onPressed: () {
                                            if (formKey.currentState!.validate()) {
                                              RegisterCubit.get(context).userRegister(
                                                firstName: firstNameController.text,
                                                lastName: lastNameController.text,
                                                email: emailController.text,
                                                password: passwordController.text,
                                              );
                                            }
                                          },
                                          child: const Text(
                                            'SIGN UP',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.0,
                                              fontFamily: 'roboto'
                                            ),
                                          ),
                                        ),
                                      ),
                                      fallback: (BuildContext context) => Center(
                                          child:
                                              const CircularProgressIndicator()),
                                    ),
                                    const SizedBox(
                                      height: 30.0,
                                    ),
                                    Row(children: const <Widget>[
                                      Expanded(child: Divider()),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text("or continue with"),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Expanded(child: Divider()),
                                    ]),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 50,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 65.0,
                                            height: 65.0,
                                            child: IconButton(
                                              onPressed: () {
                                                navigateTo(
                                                  context,
                                                  WebViewScreen(
                                                    'www.facebook.com',
                                                  ),
                                                );
                                              },
                                              icon: const Icon(
                                                Icons.facebook,
                                                size: 50.0,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 65.0,
                                            height: 65.0,
                                            child: IconButton(
                                              onPressed: () {
                                                navigateTo(
                                                  context,
                                                  WebViewScreen(
                                                    'www.gmail.com',
                                                  ),
                                                );
                                              },
                                              icon: const FaIcon(
                                                FontAwesomeIcons.google,
                                                color: Colors.red,
                                                size: 40.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}