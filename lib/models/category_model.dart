/// Id : 1
/// Name : "Food"
/// CatIcon : 1
/// Type : 1

class CategoryModel {
  CategoryModel({
      this.id, 
      this.name, 
      this.catIcon, 
      this.type,});

  CategoryModel.fromJson(dynamic json) {
    id = json['Id'];
    name = json['Name'];
    catIcon = json['CatIcon'];
    type = json['Type'];
  }
  int? id;
  String? name;
  int? catIcon;
  int? type;
CategoryModel copyWith({  int? id,
  String? name,
  int? catIcon,
  int? type,
}) => CategoryModel(  id: id ?? this.id,
  name: name ?? this.name,
  catIcon: catIcon ?? this.catIcon,
  type: type ?? this.type,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Name'] = name;
    map['CatIcon'] = catIcon;
    map['Type'] = type;
    return map;
  }

}