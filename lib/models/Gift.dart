import 'dart:convert';

class Gift {
  int ID;
  String name;
  String link;
  double price;
  String desc;
  int rate;

  Gift(this.ID, this.name, this.link, this.price, this.desc, this.rate);

  factory Gift.fromJson(Map<String, dynamic> json) {
    return Gift(
      json['id'],
      convertToUTF8(json['name']),
      json['link'],
      double.parse(json['price'].toString()),
      convertToUTF8(json['desc']),
      json['rate']
    );
  }

  Map<String, dynamic> toPost() {
    final paramDic = {
      "id": ID.toString(),
      "name": name,
      "link": link,
      "price": price.toString(),
      "desc": desc,
      "rate": rate.toString()
    };
    return paramDic;
  }
}

String convertToUTF8(String source){
  List<int> encoded = Latin1Codec().encode(source);
  String decoded = utf8.decode(encoded);
  return decoded;
}
