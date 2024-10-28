part of 'shopping_bloc.dart';

@immutable
abstract class ShoppingEvent {}

class RemoveItem extends ShoppingEvent {
  // int index;
  // RemoveItem({required this.index});

  ItemModel item;
  RemoveItem({required this.item});
}

class RefreshItem extends ShoppingEvent {
  ItemModel item;
  RefreshItem({required this.item});
}
