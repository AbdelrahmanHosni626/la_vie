import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_vie/shared/components/constant.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {

  int sum = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('My Cart')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Container(
            height: 161,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
              color: HexColor('#FFFFFF'),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                const Image(
                  image: NetworkImage(
                      'https://student.valuxapps.com/storage/uploads/products/1615440322npwmU.71DVgBTdyLL._SL1500_.jpg'),
                  fit: BoxFit.cover,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Title',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                     Text(
                      'Price',
                      style: TextStyle(
                        color: defaultColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 90,
                          height: 35,
                          decoration: BoxDecoration(
                            color: HexColor('#F8F8F8'),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 35,
                                child: IconButton(
                                  alignment: Alignment.centerLeft,
                                  onPressed: ()
                                  {
                                    setState(() {
                                      sum --;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    color: defaultColor,
                                  ),
                                ),
                              ),
                              Text(
                                '${sum.round()}',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Container(
                                width: 35,
                                child: IconButton(
                                  alignment: Alignment.centerLeft,
                                  onPressed: ()
                                  {
                                    setState(() {
                                      sum ++;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: defaultColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 30.0,
                        ),
                        IconButton(
                          color: defaultColor,
                          onPressed: () {},
                          icon: const Icon(Icons.delete_outline_outlined),
                        ),

                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: 20.0,
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
