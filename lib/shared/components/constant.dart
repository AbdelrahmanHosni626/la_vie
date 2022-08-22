 import 'dart:ui';

 import 'package:hexcolor/hexcolor.dart';
import 'package:la_vie/shared/components/components.dart';

 import '../../modules/login/login_screen.dart';
import '../network/local/cache_helper.dart';
dynamic defaultColor = Color(0xff1ABC00);

void signOut(context)
{
  CacheHelper.removeData(key: 'accessToken').then((value) {
    if(value)
    {
      navigateAndFinish(context, LoginScreen());
    }
  });
}

String? accessToken;