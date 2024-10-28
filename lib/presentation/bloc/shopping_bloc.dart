import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
// import 'package:shopping_test/data/models/item_model.dart';

import '../../data/model/item_model.dart';
part 'shopping_event.dart';
part 'shopping_state.dart';

class ShoppingBloc extends Bloc<ShoppingEvent, ShoppingState> {
  final List<ItemModel> _itemsDeleted = [];
  ShoppingBloc() : super(ShoppingState.initial()) {
    on<RemoveItem>((event, emit) {
      List<ItemModel> items = state.items;
      _itemsDeleted.add(event.item);
      items.remove(event.item);
      emit(state.copyWith(items: items));
    });
    on<RefreshItem>((event, emit) {
      List<ItemModel> items = _itemsDeleted + state.items;
      _itemsDeleted.clear();
      emit(state.copyWith(items: items));
    });
  }
}

// class ShoppingBloc extends Bloc<ShoppingEvent, ShoppingState> {
//   ShoppingBloc() : super(ShoppingState.initial()) {
//     // on<RemoveItem>((event, emit) {
//     //   List<ItemModel> items = [...state.items];
//     //   items.remove(event.index);
//     //   emit(ShoppingState(items));
//     //   // items.add(event.index);
//     // });

//     on<ShoppingEvent>((event, emit) {
//       if (event is AddItem) {
//         List<ItemModel> items = [...state.items];
//         items.add(event.item);
//         emit(ShoppingState(items));
//       } else if (event is RemoveItem) {
//         List<ItemModel> items = [...state.items];
//         items.remove(event.index);
//         emit(ShoppingState(items));
//       }
//     });
//     // });
//   }
// }
