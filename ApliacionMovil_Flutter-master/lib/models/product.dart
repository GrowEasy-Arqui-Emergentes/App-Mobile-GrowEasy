class Product {
  final int id;
  final String title;
  final String link;
  final String image;

  Product({
    required this.id,
    required this.title,
    required this.link,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json['id'] as int,
      title: json['title'] as String,
      link: json['link'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'link': link,
      'image': image,
    };
  }

}