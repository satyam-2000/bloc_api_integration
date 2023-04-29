class ProductModel{
  String name;
  String brand;
  String imageUrl;
  ProductModel({required this.name,required this.brand,required this.imageUrl});

  factory ProductModel.fromJson(Map<String,dynamic> map){
    return ProductModel(name: map["name"], brand: map["brand"], imageUrl: map["image_link"]);
  }
}