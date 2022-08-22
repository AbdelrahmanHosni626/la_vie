import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/home_layout.dart';
import '../../models/products/seeds_model.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constant.dart';
import '../my_cart/my_cart_screen.dart';
import '../plants/plants_screen.dart';
import '../tools/tools_screen.dart';

class SeedsScreen extends StatelessWidget {
  var searchController = TextEditingController();

  SeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: lavieLogo()),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: defaultFormField(
                      controller: searchController,
                      type: TextInputType.name,
                      prefix: Icons.search_outlined,
                      label: 'Search',
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: defaultColor,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                      onPressed: ()
                      {
                        navigateTo(context, MyCartScreen());
                      },
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10.0),
                      //
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          navigateAndFinish(context, HomeLayoutScreen());
                        },
                        child: const Text(
                          'All',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'roboto',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          navigateAndFinish(context, PlantsScreen());
                        },
                        child: const Text(
                          'Plants',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'roboto',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: defaultColor),
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Seeds',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'roboto',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          navigateAndFinish(context, ToolsScreen());
                        },
                        child: const Text(
                          'Tools',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'roboto',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ConditionalBuilder(
              condition: LavieCubit.get(context).seedsModel != null,
              builder: (context) => buildHome(LavieCubit.get(context).seedsModel!, context),
              fallback: (context) => const Center(child: CircularProgressIndicator(),),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHome(SeedsModel model, context) => GridView.count(
    crossAxisCount: 2,
    physics: const NeverScrollableScrollPhysics(),
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    mainAxisSpacing: 1.0,
    crossAxisSpacing: 1.0,
    childAspectRatio: 1 / 1.9,
    children: List.generate(
      LavieCubit.get(context).seedsModel!.data!.length,
          (index) => buildGridItem(
          LavieCubit.get(context).seedsModel!.data![index]),
    ),
  );

  Widget buildGridItem(SeedsData model) => Padding(
    padding: const EdgeInsets.only(
      top: 80,
      right: 5,
      left: 5,
    ),
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        color: HexColor('#FFFFFF'),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 24.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 1.0,
                  ),
                  Text(
                    '${model.description}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  defaultButton(
                    radius: 5.0,
                    background: defaultColor,
                    function: () {},
                    text: 'Add To Cart',
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: NetworkImage(
                          'https://lavie.orangedigitalcenteregypt.com ${model.imageUrl!}'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                SizedBox(
                  height: 25,
                  width: 25,
                  child: FloatingActionButton(
                    heroTag: "removeBtn",
                    onPressed: () {},
                    elevation: 0.0,
                    child: Icon(Icons.remove),
                    backgroundColor: Colors.grey[100],
                    foregroundColor: Colors.grey,
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.zero),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: Text(
                    '1',
                    style: TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 25,
                  width: 25,
                  child: FloatingActionButton(
                    heroTag: "addBtn",
                    onPressed: () {},
                    elevation: 0.0,
                    child: Icon(Icons.add),
                    backgroundColor: Colors.grey[100],
                    foregroundColor: Colors.grey,
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.zero),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
