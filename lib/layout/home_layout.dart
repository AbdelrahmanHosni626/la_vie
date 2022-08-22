import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/shared/components/components.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';



class HomeLayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LavieCubit, LavieStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          body: LavieCubit.get(context).bottomScreens[LavieCubit.get(context).currentIndex],
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                onTap: (int index)
                {
                  LavieCubit.get(context).changeBottomNavBar(index);
                },
                currentIndex: LavieCubit.get(context).currentIndex,
                items: const [
                  BottomNavigationBarItem(
                    icon: FaIcon(FontAwesomeIcons.leaf),
                    label: 'Leaf',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.qr_code,
                    ),
                    label: 'QrCode',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      size: 50,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.notifications_none_outlined,
                    ),
                    label: 'Notifications',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person_outline,
                    ),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
