import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable{}

class ProductsLoadingEvent extends ProductEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductsLoadedEvent extends ProductEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductsErrorEvent extends ProductEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}