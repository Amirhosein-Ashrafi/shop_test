part of 'shopping_bloc.dart';

@immutable
abstract class ShoppingEvent {}

/// برای حذف کردن یک آیتم از لیست.
class RemoveItem extends ShoppingEvent {
  ItemModel item;
  RemoveItem({required this.item});
}

/// برای برگرداندن ایتم های حذف شده از لیست.
class RefreshItem extends ShoppingEvent {
  ItemModel item;
  RefreshItem({required this.item});
}
