import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_vie/layout/home_layout.dart';
import 'package:la_vie/modules/login/cubit/cubit.dart';
import 'package:la_vie/modules/login/cubit/states.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constant.dart';
import '../../shared/network/local/cache_helper.dart';
import '../register/register_screen.dart';
import '../web_view/web_view_screen.dart';



class LoginScreen extends StatelessWidget {

  final FacebookLogin? facebookLogin = FacebookLogin();


  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, state) {
          if (state is LoginSuccessState) {
            showToast(
              text: state.loginModel.message!,
              state: ToastStates.SUCCESS,
            );
            CacheHelper.saveData(
              key: 'accessToken',
              value: state.loginModel.data!.accessToken,
            ).then((value) {
              accessToken = state.loginModel.data!.accessToken;
            });
            navigateAndFinish(
              context,
              HomeLayoutScreen(),
            );
          } else if (state is LoginErrorState){
            showToast(
              text: 'Email or password is not correct!',
              state: ToastStates.ERROR,
            );
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
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            navigateAndFinish(
                                                context, RegisterScreen());
                                          },
                                          child: const Text(
                                            'Sign Up',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18.0,
                                              fontFamily: 'roboto',
                                            ),
                                          ),
                                        ),
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
                                              'Login',
                                              style: TextStyle(
                                                color: HexColor('#1ABC00'),
                                                fontSize: 18.0,
                                                fontFamily: 'roboto',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                 const    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Email'
                                      ),
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
                                    const    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          'Password'
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    defaultFormField(
                                      controller: passwordController,
                                      type: TextInputType.visiblePassword,
                                      isPassword:
                                          LoginCubit.get(context).isPassword,
                                      prefix: Icons.lock_outline,
                                      suffix: LoginCubit.get(context).suffix,
                                      suffixPressed: () {
                                        LoginCubit.get(context)
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
                                          LoginCubit.get(context).userLogin(
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
                                      condition: true,
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
                                            if (formKey.currentState!
                                                .validate()) {
                                              LoginCubit.get(context).userLogin(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text,
                                              );
                                            }
                                          },
                                          child: const Text(
                                            'LOGIN',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.0),
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
                                                getFacebookUserData();
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

  void getFacebookUserData() async {
    final result = await facebookLogin!.logIn();

    switch (result.status) {
      case FacebookLoginStatus.success:
        print(result.accessToken!.token);
          break;
      case FacebookLoginStatus.cancel:
        break;

      case FacebookLoginStatus.error:
        print(result.error);
          break;
    }
  }
}
