class UserModel{
  String id;
  String name;
  String email;
  String phone;

  UserModel({
    required this.id,
    required this.email,
    required this.phone,
    required this.name,
});

  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(
      id: json["id"],
        email: json["email"],
        phone: json["phone"],
        name: json["name"]
    );

  }

  Map<String,dynamic> toJson(){
    return{
      "id":id,
      "email":email,
      "name":name,
      "phone":phone,
    };
  }

}