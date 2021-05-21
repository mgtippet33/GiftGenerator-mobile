class User {
  String token;
  String name;
  String email;
  String password;
  bool premium;
  int theme;

  User(this.token, this.name, this.email, this.password, this.premium, this.theme);

  Map<String,dynamic> toPost(){
    final paramDic = {
      "token" : token,
      "name" : name,
      "email": email,
      "password": password,
      "premium": premium.toString(),
      "theme": theme.toString()
    };
    return paramDic;
  }

  factory User.fromJson(Map<String, dynamic> json){
    return User(
        json['token'],
        json['name'],
        json['email'],
        json['password'],
        json['premium'],
        json['theme'],
    );
  }
}