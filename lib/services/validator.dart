class FormValidator {
  static FormValidator _instance;

  factory FormValidator() => _instance ??= new FormValidator._();

  FormValidator._();

  String password = '';

  String validatePassword(String value) {
    password = value;
    String patttern = r'(^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.isEmpty) {
      return "Потрібен пароль";
    } else if (value.length < 8) {
      return "Пароль повинен містити не менше восьми символів";
    } else if (!regExp.hasMatch(value)) {
      return "Введіть принаймні одну велику літеру, одну малу літеру\nта одну цифру";
    }
    return null;
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return "Потрібна електронна адреса";
    } else if (!regExp.hasMatch(value)) {
      return "Введіть коректну поштову адресу";
    } else {
      return null;
    }
  }

  String validateName(String value) {
    if (value.isEmpty) {
      return "Потрібно вказати ім’я";
    } else if (value.length < 2) {
      return "Ім\'я має містити не менше двох символів";
    }
    return null;
  }

  String validateAge(String value){
    String patttern = r'(^\d{1,3}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.isEmpty) {
      return "Потрібно ввести вік";
    } else if (!regExp.hasMatch(value)) {
      return "Введіть коректний вік";
    } else {
      return null;
    }
  }
  String validateLink(String value){
    String patttern1 = r'(^https:\/\/www.facebook.com\/+$)';
    String patttern2 = r'(^https:\/\/twitter.com\/+$)';
    RegExp regExp1 = new RegExp(patttern1);
    RegExp regExp2 = new RegExp(patttern2);
    if (value=="None" || value =="") {
      return null;
    } else if (!regExp1.hasMatch(value) || !regExp2.hasMatch(value)) {
      return "Введіть коректне посилання";
    } else {
      return null;
    }
  }
}