class CategoryModel {
  CategoryModel({
    this.name,
    this.image,
  });

  String name;
  String image;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
      };
}
