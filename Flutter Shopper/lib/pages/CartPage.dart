import 'package:codepur/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:codepur/models/cartModel.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.cream,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: "Cart".text.make(),
          elevation: 0,
        ),
        body: Column(children: [cartlist().p32().expand(), Divider(), cardTotal()]));
  }
}

class cardTotal extends StatelessWidget {
  final cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "JHV".text.xl5.make(),
          30.widthBox,
          ElevatedButton(
              child: "Buy".text.white.make(),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurple)),
              onPressed: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                    content: "Buying not supported".text.make(),
                    duration: const Duration(
                        seconds:
                            1))); // this is a scaffold snackbar , it is used to give small messages at the bottom of the scaffold , to understand usage and syntax go to flutter.io
              })
        ],
      ),
    );
  }
}

class cartlist extends StatefulWidget {
  @override
  _cartlistState createState() => _cartlistState();
}

class _cartlistState extends State<cartlist> {
  final cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cart.datalist.length,
        itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.ac_unit_rounded),
                onPressed: () {},
              ),
              title: Text(cart.datalist[index].name),
            ));
  }
}
