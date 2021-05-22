class Interest {
  final String name;

  Interest(this.name);

  factory Interest.fromJson(Map<String, dynamic> json){
    return Interest(
        json['name']
    );
  }

  @override
  String toString(){
    return name;
  }
}