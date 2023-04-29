import 'dart:convert';
import 'dart:developer';
import 'package:practice/utils/constants/app_constant.dart';
import 'package:http/http.dart' as http;
import 'package:practice/models/product_model.dart';

class ProductRepository{
  Future<List<ProductModel>> fetchProducts() async{
    try{
      http.Response response=await http.get(Uri.parse(AppConstant.fetProductsUrl));
      log(response.body);
      if(response.statusCode==200){
        List<dynamic> res=jsonDecode(response.body);
        List<ProductModel> products=res.map((e) =>ProductModel.fromJson(e)).toList();
        return products;
      }
      else{
        throw Exception(response.reasonPhrase);
      }
    }
    catch(e){
      throw Exception(e.toString());
    }
    return [];
  }
}