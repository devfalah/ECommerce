class UserModel {
  UserModel({
    this.userId,
    this.email,
    this.name,
    this.pic,
  });

  String userId;
  String email;
  String name;
  String pic;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["userId"],
        email: json["email"],
        name: json["name"],
        pic: json["pic"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "email": email,
        "name": name,
        "pic": pic,
      };
}
