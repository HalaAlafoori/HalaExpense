/// Id : 1
/// SpentLimit : 20000.00
/// CatId : 1

class PlanModel {
  PlanModel({
      this.id, 
      this.spentLimit, 
      this.catId,});

  PlanModel.fromJson(dynamic json) {
    id = json['Id'];
    spentLimit = json['SpentLimit'];
    catId = json['CatId'];
  }
  int? id;
  double? spentLimit;
  int? catId;
PlanModel copyWith({  int? id,
  double? spentLimit,
  int? catId,
}) => PlanModel(  id: id ?? this.id,
  spentLimit: spentLimit ?? this.spentLimit,
  catId: catId ?? this.catId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['SpentLimit'] = spentLimit;
    map['CatId'] = catId;
    return map;
  }

}