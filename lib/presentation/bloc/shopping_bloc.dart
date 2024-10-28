import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_test/data/model/item_model.dart';
part 'shopping_event.dart';
part 'shopping_state.dart';

class ShoppingBloc extends Bloc<ShoppingEvent, ShoppingState> {
  /// لیست برای ایتم هایی که قراره از صفحه اصلی و لیست ایتم ها حذف بشند.

  final List<ItemModel> itemRemove = [];
  ShoppingBloc() : super(ShoppingState.initial()) {
    /// عملیات حذف ایتم از صفحه اصلی.
    on<RemoveItem>((event, emit) {
      /// اینم های موجود در حال حاظر.
      List<ItemModel> items = [...state.items];

      /// اضافه کردن به لیست ایتم های حذف شده.
      itemRemove.add(event.item);

      ///حذف از لیست ایتم های صفحه اصلی.
      items.remove(event.item);

      /// ساخت نمونه جدید با در نظر گرفتن نغیرات اعمال شده.
      emit(state.copyWith(items: items));
    });

    ///عملیات برگرداندن ایتم های حذف شده به صفحه و لیست ایتم ها.
    on<RefreshItem>((event, emit) {
      /// در این قسمت لیست ایتم های حذف شده را با لیست ایتم های اصلی ترکیب میکنیم
      List<ItemModel> items = itemRemove + state.items;

      /// حالا ایتم های لیست راپاک میکنیم بعد از ترکیب
      itemRemove.clear();

      /// ساخت نمونه مجدد از صفحه با در نظر گرفتن تغیرات اعمال شده.
      emit(state.copyWith(items: items));
    });
  }
}
