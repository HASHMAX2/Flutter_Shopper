class Catalog {
  // define insatnce variables
  int id;
  String name;
  String description;
  String color;
  int price;
  String image = "";

  Catalog(
      // constructor1
      // making parameterised constructor and that too named
      {this.id,
      this.color,
      this.name,
      this.description,
      this.image,
      this.price});

  factory Catalog.fromMap(Map<dynamic, dynamic> m) {
    // Constructor 2 ,mapping constructor
    // map to list conversion constructor
    // method to decode the data
    // this constructor has to be returned
    return Catalog(
        id: m["id"], // indicating assigning of val against id, color etc
        color: m["color"],
        name: m["name"],
        description: m["description"],
        image: m["image"],
        price: m["price"]);
  }

  factory Catalog.x(Map m) {
    return Catalog(
        id: m["id"], // indicating assigning of val agains id, color etc
        color: m["color"],
        name: m["name"],
        description: m["description"],
        image: m["image"],
        price: m["price"]);
  }
  // method to encode the data
  tomap() => {
        "id": id, // the orange ones are the key declarations
        "color": color,
        "name": name,
        "description": description,
        "image": image,
        "price": price
      };
}
