import 'Gift.dart';
import 'dart:convert';

class UserHistoryModel {
  String holiday;
  String date;
  List<dynamic> interests;
  String link;
  String gender;
  int age;
  List<Gift> gifts;
  List<bool> isOpen;

  UserHistoryModel(this.holiday, this.date,  this.age, this.link, this.gender, this.interests, this.gifts, this.isOpen);


  factory UserHistoryModel.fromJson(Map<String, dynamic> json){
    List<Gift> gifts = json['presents'].map<Gift>((json) => Gift.fromJson(json)).toList();
    return UserHistoryModel(
        convertToUTF8(json['holiday']),
        json['date'],
        json['age'],
        json['link'],
        convertToUTF8(json['gender']),
        json['criteria'].map<String>((json) => convertToUTF8(json)).toList(),
        gifts,
        List.filled(gifts.length, false)
    );
  }
}

String convertToUTF8(String source){
  List<int> encoded = Latin1Codec().encode(source);
  String decoded = utf8.decode(encoded);
  return decoded;
}