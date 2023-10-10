/// Id : 1
/// Name : "Burger"
/// Total : 5500.00
/// TransDate : "YYYY-MM-DD"
/// CatId : 1

class TransactionModel {
  TransactionModel({
      this.id, 
      this.name, 
      this.total, 
      this.transDate, 
      this.catId,});

  TransactionModel.fromJson(dynamic json) {
    id = json['Id'];
    name = json['Name'];
    total = json['Total'];
    transDate = json['TransDate'];
    catId = json['CatId'];
  }
  int? id;
  String? name;
  double? total;
  String? transDate;
  int? catId;
TransactionModel copyWith({  int? id,
  String? name,
  double? total,
  String? transDate,
  int? catId,
}) => TransactionModel(  id: id ?? this.id,
  name: name ?? this.name,
  total: total ?? this.total,
  transDate: transDate ?? this.transDate,
  catId: catId ?? this.catId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Name'] = name;
    map['Total'] = total;
    map['TransDate'] = transDate;
    map['CatId'] = catId;
    return map;
  }

}