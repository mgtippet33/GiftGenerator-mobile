class User {
  int ID;
  String name;
  String email;
  String password;
  bool premium;
  int theme;

  User(this.ID, this.name, this.email, this.password, this.premium, this.theme);

  Map<String,dynamic> toPost(){
    final paramDic = {
      "id" : ID.toString(),
      "name" : name,
      "email": email,
      "password": password,
      "premium": premium,
      "theme": theme
    };
    return paramDic;
  }

  factory User.fromJson(Map<String, dynamic> json){
    return User(
        json['id'],
        json['name'],
        json['email'],
        json['password'],
        json['premium'],
        json['theme'],
    );
  }
}