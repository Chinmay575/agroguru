// ignore_for_file: must_be_immutable

part of 'store_bloc.dart';

class StoreState extends Equatable {
  List<Product> products;
  StoreState({
    required this.products,
  });

  @override
  List<Object> get props => [products];
}

class StoreLoadingState extends StoreState {
  StoreLoadingState() : super(products: []);
}
