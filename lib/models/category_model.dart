/// CatId : 1
/// CatName : "Food"
/// CatIcon : 2
/// Type : 0

class CategoryModel {
  CategoryModel({
      this.catId, 
      this.catName, 
      this.catIcon, 
      this.type,});

  CategoryModel.fromJson(dynamic json) {
    catId = json['CatId'];
    catName = json['CatName'];
    catIcon = json['CatIcon'];
    type = json['Type'];
  }
  int? catId;
  String? catName;
  int? catIcon;
  int? type;
CategoryModel copyWith({  int? catId,
  String? catName,
  int? catIcon,
  int? type,
}) => CategoryModel(  catId: catId ?? this.catId,
  catName: catName ?? this.catName,
  catIcon: catIcon ?? this.catIcon,
  type: type ?? this.type,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['CatId'] = catId;
    map['CatName'] = catName;
    map['CatIcon'] = catIcon;
    map['Type'] = type;
    return map;
  }

}