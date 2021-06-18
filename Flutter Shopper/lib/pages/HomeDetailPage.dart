import 'package:codepur/models/catalog.dart';
import 'package:codepur/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Catalog item;

  const HomeDetailPage({Key key, @required this.item})
      : assert(item != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.cream,
        elevation: 0,
      ),
      backgroundColor: MyTheme.cream,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${item.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
              onPressed: () {},
              child: "Add to Cart".text.make(),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(MyTheme.darkbluish),
                  shape: MaterialStateProperty.all(StadiumBorder())),
              // this is the material state prop which helps in giving props to elevated button
              // MaterialStateProperty.all the all here specifies that an action should take place irrespective
              // of whwteher the button is pressed or just hovered upon etc. this is more helpful when it comes to
              // web
            ).wh(120, 40),
          ],
        ).p24(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Hero(
                  tag: Key(item.id
                      .toString()), // to use a hero widget we need to have the same tag at both places,
                  //in the caller and the callee
                  child: Image.network(item.image))
              .h32(context),
          Expanded(
            child: VxArc(
                height: 30,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  color: Colors.white,
                  child: Column(
                    children: [
                      item.name.text.bold.xl3.color(MyTheme.darkbluish).make(),
                      HeightBox(10.0),
                      item.description.text.xl.textStyle(context.captionStyle).bold.make(),
                      "Et diam dolores nonumy accusam consetetur lorem ipsum. Sed eos eos sanctus sadipscing et sit, diam labore sit labore elitr sed consetetur. Erat voluptua gubergren dolores consetetur takimata amet dolor et, dolores amet tempor sed ut sed consetetur gubergren rebum.."
                          .text
                          .textStyle(context.captionStyle)
                          .bold
                          .make()
                          .p16()
                    ],
                  ).py64(),
                )),
          ) // if u declare a container here without expanded or
          // without a height , despite having a backgrond color , you will see a blank screen . tip: whenever u wat to use a
          // container make sure u give it a height
        ]),
      ),
    );
  }
}
