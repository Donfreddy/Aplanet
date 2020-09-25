class Animal {
  String name;
  String status;
  String sciName;
  String weight;
  String length;
  String babitats;
  String places;
  String desc;
  List<String> images;
  String threatTitle;
  List<String> threatBody;
  String sType;

  Animal(
    String name,
    String status,
    String sciName,
    String weight,
    String length,
    String babitats,
    String places,
    String desc,
    List<String> images,
    String threatTitle,
    List<String> threatBody,
    String sType,
  ) {
    this.name = name;
    this.status = status;
    this.sciName = sciName;
    this.weight = weight;
    this.length = length;
    this.babitats = babitats;
    this.places = places;
    this.desc = desc;
    this.images = images;
    this.threatTitle = threatTitle;
    this.threatBody = threatBody;
    this.sType = sType;
  }

  Animal.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        status = json['status'],
        sciName = json['sci_name'],
        weight = json['weight'],
        length = json['length'],
        babitats = json['babitats'],
        places = json['places'],
        desc = json['desc'],
        images = json['images'].cast<String>(),
        threatTitle = json['threat_title'],
        threatBody = json['threat_body'].cast<String>(),
        sType = json['sType'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'status': status,
      'sci_name': sciName,
      'weight': weight,
      'length': length,
      'babitats': babitats,
      'places': places,
      'desc': desc,
      'images': images,
      'threat_title': threatTitle,
      'threat_body': threatBody,
      'sType': sType
    };
  }
}

//class Animal {
//  String name;
//  String status;
//  String sciName;
//  String weight;
//  String length;
//  String babitats;
//  String places;
//  String desc;
//  List<String> images;
//  String threatTitle;
//  List<String> threatBody;
//  String sType;
//
//  Animal(
//      {this.name,
//      this.status,
//      this.sciName,
//      this.weight,
//      this.length,
//      this.babitats,
//      this.places,
//      this.desc,
//      this.images,
//      this.threatTitle,
//      this.threatBody,
//      this.sType});
//
//  Animal.fromJson(Map<String, dynamic> json) {
//    name = json['name'];
//    status = json['status'];
//    sciName = json['sci_name'];
//    weight = json['weight'];
//    length = json['length'];
//    babitats = json['babitats'];
//    places = json['places'];
//    desc = json['desc'];
//    images = json['images'].cast<String>();
//    threatTitle = json['threat_title'];
//    threatBody = json['threat_body'].cast<String>();
//    sType = json['_type'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['name'] = this.name;
//    data['status'] = this.status;
//    data['sci_name'] = this.sciName;
//    data['weight'] = this.weight;
//    data['length'] = this.length;
//    data['babitats'] = this.babitats;
//    data['places'] = this.places;
//    data['desc'] = this.desc;
//    data['images'] = this.images;
//    data['threat_title'] = this.threatTitle;
//    data['threat_body'] = this.threatBody;
//    data['_type'] = this.sType;
//    return data;
//  }
//}
