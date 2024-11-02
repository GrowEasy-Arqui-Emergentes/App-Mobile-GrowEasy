class Course {
  final int id;
  final String name;
  final String image;
  final String description;
  final String price;
  final String duration;
  final String category;

  Course({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.duration,
    required this.category,
  });

  factory Course.fromJson(Map<String, dynamic> map){
    return Course(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
      price: map['price'] as String,
      duration: map['duration'] as String,
      category: map['category'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'price': price,
      'duration': duration,
      'category': category,
    };
  }
}
