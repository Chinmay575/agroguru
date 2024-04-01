import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

import '../../../data/models/product.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc() : super(StoreState(products: const [])) {
    on<LoadMockData>((event, emit) async {
      emit(StoreLoadingState());

      String data =
          await rootBundle.loadString('assets/json/products_data.json');

      Map<String, dynamic> p = jsonDecode(data);

      List<Product> products = (p['products'] as List<dynamic>)
          .map(
            (e) => Product.fromMap(e),
          )
          .toList();

      emit(
        StoreState(products: products),
      );
    });
  }
}
