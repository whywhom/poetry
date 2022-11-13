import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/category.dart';
import '../widgets/list_item.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key, required this.title});

  final String title;

  @override
  State<CategoryWidget> createState() => _CategoryState();
}

class _CategoryState extends State<CategoryWidget> {
  late Future<Category> category;

  @override
  void initState() {
    super.initState();
    category = readJson();
  }

  Future<Category> readJson() async {
    final String response =
        await rootBundle.loadString('assets/files/category/category.json');
    final data = await json.decode(response);
    return Category.fromJson(data);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("目录"),
      ),
      body: Center(
        child: FutureBuilder<Category>(
          future: category,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                primary: false,
                childAspectRatio: (width / height),
                padding: const EdgeInsets.all(2),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 8,
                children: _getItems(snapshot.data!)
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  _getItems(Category data) {
    List<Widget> list = [];
    for(int i =0;i<data.items.length;i++){
      list.add(CardItemWidget(
          title: data.items[i].title!
      ));
    }
    return list;
  }

}
