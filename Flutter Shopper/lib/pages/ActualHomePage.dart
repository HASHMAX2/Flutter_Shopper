import 'package:codepur/pages/HomeDetailPage.dart';
import 'package:codepur/utils/Routes.dart';
import 'package:codepur/widgets/drawer.dart';
import 'package:codepur/widgets/listwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:codepur/widgets/drawer.dart';
import "package:codepur/models/catalog.dart";
import "package:codepur/models/data.dart";
import 'package:flutter/services.dart'; // this lib is used by rootbundle
import "dart:convert"; // json coder decoder library
import "package:velocity_x/velocity_x.dart"; // used for velocityX ui bundle
import 'package:codepur/utils/themes.dart';

class ActualHomePage extends StatefulWidget {
  @override
  _ActualHomePageState createState() => _ActualHomePageState();
}

class _ActualHomePageState extends State<ActualHomePage> {
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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      // if u dont use velocity X the above line is rewritten as
      // backgroundColor: Themeof(context).canavasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.CartRoute),
        child: Icon(CupertinoIcons.cart),
        backgroundColor: MyTheme.darkbluish,
      ),
      //backgroundColor: MyTheme.cream,

      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              if (data.items != null && data.items.isNotEmpty)
                FetchDataList().expand() // there is a
              //FetchDataList()
              else
                Center(child: CircularProgressIndicator().expand())
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "CatalogApp".text.xl5.bold.color(MyTheme.darkbluish).make(),
        "Pending products".text.color(MyTheme.darkbluish).xl2.make()
      ],
    );
  }
}

class FetchDataList extends StatelessWidget {
  final Catalog item;
  const FetchDataList({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //shrinkWrap: false,
      itemCount: data.items.length,
      itemBuilder: (context, index) {
        final x = data.items[index];
        return InkWell(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeDetailPage(item: x))),
          child: widgetlist(item: x),
          //item: data.items[index],
        );
      },
    );
  }
}

class widgetlist extends StatelessWidget {
  @override
  final Catalog item;

  const widgetlist({Key key, @required this.item})
      : assert(item != null),
        super(key: key);
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(item.id.toString()), // hero widget tag
            child: Image.network(item.image)
                .w32(context)
                .box
                .rounded
                .color(MyTheme.cream)
                .make()
                .p16()),
        Column(mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              item.name.text.bold.color(MyTheme.darkbluish).make(),
              item.description.text.textStyle(context.captionStyle).make(),
              SizedBox(height: 10.0),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${item.price}".text.bold.xl.make(),
                  ElevatedButton(
                    onPressed: () {},
                    child: "buy".text.make(),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(MyTheme.darkbluish),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    // this is the material state prop which helps in giving props to elevated button
                    // MaterialStateProperty.all the all here specifies that an action should take place irrespective
                    // of whwteher the button is pressed or just hovered upon etc. this is more helpful when it comes to
                    // web
                  ),
                ],
              )
            ])
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Container(
        //       //color: Colors.red,
        //       child: Image.network(item.image),
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.all(Radius.circular(10.0)), color: MyTheme.cream)),
        // ),
      ],
    )).white.rounded.square(150).make().py8();
    // using py16 beofre and after make() has a completely different effect
    // on the code
  }
}
