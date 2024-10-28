part of 'shopping_bloc.dart';

class ShoppingState {
  final List<ItemModel> items;
  ShoppingState({required this.items});

  factory ShoppingState.initial() => ShoppingState(items: [
        ItemModel(
          image: "assets/image/iphone15.png",
          title: "Iphone 15",
          description: "Battery to see the elapsed time since iPad was charged",
        ),
        ItemModel(
          image: "assets/image/ipad.png",
          title: "Ipad 4",
          description: "Battery to see the elapsed time since iPad was charged",
        ),
        ItemModel(
          image: "assets/image/handsfree.jpg",
          title: "HandsFree",
          description: "Battery to see the elapsed time since iPad was charged",
        ),
        ItemModel(
          description: "Battery to see the elapsed time since iPad was charged",
          image: "assets/image/charger.jpg",
          title: "Charger",
        ),
        ItemModel(
            image: "assets/image/ipod.png",
            title: "Ipod Touch",
            description:
                "Battery to see the elapsed time since iPad was charged"),
        ItemModel(
            image: "assets/image/headphone.png",
            title: "Headphone",
            description:
                "Battery to see the elapsed time since iPad was charged"),
        ItemModel(
            image: "assets/image/mack_book.png",
            title: "Mack Book",
            description:
                "Battery to see the elapsed time since iPad was charged"),
      ]);

  ShoppingState copyWith({List<ItemModel>? items}) =>
      ShoppingState(items: items ?? this.items);
}
