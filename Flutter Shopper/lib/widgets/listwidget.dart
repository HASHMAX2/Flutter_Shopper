import "package:flutter/material.dart";
import "package:codepur/models/catalog.dart";

class listwidget extends StatelessWidget {
  final Catalog item; // whatever data shall go onto the dispaly screen has to have
  // the same props as that of catalog class constructor

  const listwidget({Key key, @required this.item}) // making is compulsary to pass an item
      : assert(item != null),
        super(key: key); // the item being passed should not be null
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
        leading: Image.network(this.item.image),
        title: Text(this.item.name),
        subtitle: Text(this.item.description),
        trailing: Text(
          "\$" + this.item.price.toString(),
          textScaleFactor: 1.5,
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
            //fontSize: 10.0)
          ),
        ),
      ),
    );
  }
}
