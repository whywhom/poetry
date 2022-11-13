import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poetry/model/gushishijiushou.dart';

import '../model/shijing.dart';
import '../widgets/list_item.dart';

class GushiShijiushouWidget extends StatefulWidget {
  const GushiShijiushouWidget({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<GushiShijiushouWidget> createState() => _GushiShijiushouState();
}

class _GushiShijiushouState extends State<GushiShijiushouWidget> {

  late Future<GushiShijiushou> gushishijiushou;

  @override
  void initState() {
    super.initState();
    gushishijiushou = readJson();
  }

  Future<GushiShijiushou> readJson() async {
    final String response = await rootBundle.loadString('assets/files/gushishijiushou/gushishijiushou.json');
    final data = await json.decode(response);
    return GushiShijiushou.fromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bk.jpg'),
              fit: BoxFit.fitWidth, // 完全填充
            ),
          ),
          child: FutureBuilder<GushiShijiushou>(
            future: gushishijiushou,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.items.length,
                  prototypeItem: const ListTile(
                    title: Text("古诗十九首"),
                  ),
                  itemBuilder: (context, index) {
                    return CardItemWidget(
                        title: snapshot.data!.items[index].title!
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),

      ),
    );
  }
}
