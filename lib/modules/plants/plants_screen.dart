import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_vie/layout/cubit/cubit.dart';
import 'package:la_vie/shared/components/components.dart';
import '../../layout/home_layout.dart';
import '../../models/products/plants_model.dart';
import '../../shared/components/constant.dart';
import '../my_cart/my_cart_screen.dart';
import '../seeds/seeds_screen.dart';
import '../tools/tools_screen.dart';

class PlantsScreen extends StatelessWidget {
  var searchController = TextEditingController();

  PlantsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: lavieLogo()),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
                  SizedBox(
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
                      border: Border.all(color: defaultColor),
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Plants',
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
                          navigateAndFinish(context, SeedsScreen());
                        },
                        child: const Text(
                          'Seeds',
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
              condition: LavieCubit.get(context).plantsModel != null,
              builder: (context) => buildHome(LavieCubit.get(context).plantsModel!, context),
              fallback: (context) => const Center(child: CircularProgressIndicator(),),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHome(PlantsModel model, context) => GridView.count(
    crossAxisCount: 2,
    physics: const NeverScrollableScrollPhysics(),
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    mainAxisSpacing: 1.0,
    crossAxisSpacing: 1.0,
    childAspectRatio: 1 / 1.9,
    children: List.generate(
      LavieCubit.get(context).plantsModel!.data!.length,
          (index) => buildGridItem(
          LavieCubit.get(context).plantsModel!.data![index]),
    ),
  );

  Widget buildGridItem(PlantsData model) => Padding(
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
                    '${model.temperature}',
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
                          'https://lavie.orangedigitalcenteregypt.com${model.imageUrl!}'),
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
