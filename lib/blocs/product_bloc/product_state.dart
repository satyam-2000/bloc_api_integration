import 'package:equatable/equatable.dart';
import 'package:practice/models/product_model.dart';

abstract class ProductState extends Equatable{}

class ProductLoadingState extends ProductState{
  @override
  List<Object?> get props => [];
}

class ProductLoadedState extends ProductState{
  final List<ProductModel> products;
  ProductLoadedState(this.products);
  @override
  List<Object?> get props => [products];
}

class ProductErrorState extends ProductState{
  String error;
  ProductErrorState(this.error);
  @override
  List<Object?> get props => [error];
}