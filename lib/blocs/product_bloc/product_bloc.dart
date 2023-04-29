import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/blocs/product_bloc/product_events.dart';
import 'package:practice/blocs/product_bloc/product_state.dart';
import 'package:practice/repositories/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>{

  final ProductRepository _productRepository;

  ProductBloc(this._productRepository):super(ProductLoadingState()) {
    on<ProductsLoadingEvent>((event, emit) async{
      emit(ProductLoadingState());
      try{
        final products=await _productRepository.fetchProducts();
        if(products.isEmpty){
          emit(ProductErrorState("Error Occured"));
        }
        else{
          emit(ProductLoadedState(products));
        }
      }
      catch(e){
        emit(ProductErrorState("Some Error Occured"));
      }
    });
  }
}