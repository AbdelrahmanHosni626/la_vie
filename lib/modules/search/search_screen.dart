import 'package:flutter/material.dart';
import 'package:la_vie/layout/cubit/cubit.dart';
import 'package:la_vie/models/products/products_model.dart';
import 'package:la_vie/shared/components/components.dart';

class SearchData extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions

    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.close),
      )
    ];
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading

    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(Icons.arrow_back_outlined),
    );
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    ListView.separated(
      itemBuilder: (context, index) => ListTile(
        title: Text('${LavieCubit.get(context).productsModel!.data![index]}'),
      ),
      separatorBuilder: (context, index) => Divider(),
      itemCount: LavieCubit.get(context).productsModel!.data!.length,
    );
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    return Text('data');
    throw UnimplementedError();
  }
}
