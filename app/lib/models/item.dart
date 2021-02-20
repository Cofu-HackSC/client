class Item {
  String itemID, sellerID, name, photoURL, ingredients, description;
  double cost, avgItemRating;
  int stock;
  bool delivery, pickup;

  Item({
    this.itemID,
    this.sellerID,
    this.name,
    this.photoURL,
    this.ingredients,
    this.description,
    this.cost,
    this.avgItemRating,
    this.stock,
    this.delivery,
    this.pickup,
  });
}
