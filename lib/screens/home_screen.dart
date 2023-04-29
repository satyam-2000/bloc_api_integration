import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/blocs/product_bloc/product_bloc.dart';
import 'package:practice/blocs/product_bloc/product_events.dart';
import 'package:practice/blocs/product_bloc/product_state.dart';
import 'package:practice/models/product_model.dart';
import 'package:practice/repositories/product_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ProductBloc(
          RepositoryProvider.of<ProductRepository>(context)
      )..add(ProductsLoadingEvent()),
      child: Scaffold(
        appBar: AppBar(title: Text("Bloc Api Integration"),),
        body: BlocBuilder<ProductBloc,ProductState>(
          builder: (context,state){
            if(state is ProductLoadingState){
              return Center(child: CircularProgressIndicator(),);
            }
            if(state is ProductLoadedState){
              List<ProductModel> products=state.products;
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context,index){
                  return ListTile(leading: CircleAvatar(child: Image(image: NetworkImage("https://tse2.mm.bing.net/th?id=OIP.qExits9Z1UFEhuQi0mDVbwHaGp&pid=Api&P=0"),
                  )),
                  title: Text(products[index].name),
                  );
                }),
              );
            }
            if(state is ProductErrorState){
              return Container(child: Center(child: Text(state.error)),);
            }
            return Container();
          },
        ),
      ),
    );
  }
}
