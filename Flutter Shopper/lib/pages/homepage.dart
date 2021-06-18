import 'package:codepur/widgets/drawer.dart';
import 'package:codepur/widgets/listwidget.dart';
import 'package:flutter/material.dart';
import 'package:codepur/widgets/drawer.dart';
import "package:codepur/models/catalog.dart";
import "package:codepur/models/data.dart";
import 'package:flutter/services.dart'; // this lib is used by rootbundle
import "dart:convert"; // json coder decoder library
import "package:velocity_x/velocity_x.dart"; // used for velocityX ui bundle

class Homepage extends StatefulWidget {
  // final dummylist = List.generate(20, (index) => data.items[0]); // this was to generate a dummy list
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // using this we can accss the state of the widget, this method comes
    //into being b4 the build method is called
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2)); // were deliberately waiting for 2 seconds to see
    //how much time data takes to load
    String Jsondata =
        await rootBundle.loadString("assets/files/data.json"); // rootbundle is used to
    // extract data from the assets folder
    var decodedData =
        jsonDecode(Jsondata); // once data is received it cant be used without decoding
    // the dynamic data type which is being returned here can be a map or any other datatype
    //so we use breakpoints to determine if its a list or a map.
    var productsdata = decodedData["products"]; // here we are passing value from products key to
    // productsdata
    data.items = List.from(productsdata).map<Catalog>((e) => Catalog.x(e)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Vx.amber200, velocityX in action
        //backgroundColor: Colors.deepPurple,
        //title: "sdkjbc".text.make() // title takes a widget but here it can be
        //used with using a widget by simply using velocity
        title: Text('Catalog App')
            .text
            .red400
            .make(), // velocityX can be appended to the flutter widgets too

        //   title: "CatalogApp"
        //       .text
        //       .bold
        //       .xl
        //       .blue300
        //       .make(), // use make method for text ,its a part of syntax
        //
      ),
      body: (data.items != null && data.items.isNotEmpty)
          ? ListView.builder(
              itemCount: data.items.length,
              // itemCount: dummylist.length, // no of elemnets on the basis of dummy list
              itemBuilder: (context, index) {
                return listwidget(
                  item: data
                      .items[index], // item is not a priop of listwidget but a contructor argumnet
                  // item: dummylist[index],
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      drawer: MyDrawer(),
    );
  }
}
