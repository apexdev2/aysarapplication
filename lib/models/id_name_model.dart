class IdNameModel {
  int? id;
  String? name;
  String? image;
  String? key;

  IdNameModel({this.id, this.name, this.image, this.key});
  IdNameModel.fromJson(Map<String, dynamic> json) {
    id = (json['id']) is String ? int.parse(json['id']) : json['id'];
    name = json['title'] ?? json['name'];
    image = json['image'];
    key = json['key'];
  }
}
