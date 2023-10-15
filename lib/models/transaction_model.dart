/// TransId : 0
/// TransName : "Sandwiches"
/// CatId : 1
/// Total : 2000.0
/// TransDate : 20001382

class TransactionModel {
  TransactionModel({
      this.transId, 
      this.transName, 
      this.catId, 
      this.total, 
      this.transDate,});

  TransactionModel.fromJson(dynamic json) {
    transId = json['TransId'];
    transName = json['TransName'];
    catId = json['CatId'];
    total = json['Total'];
    transDate = json['TransDate'];
  }
  int? transId;
  String? transName;
  int? catId;
  double? total;
  int? transDate;
TransactionModel copyWith({  int? transId,
  String? transName,
  int? catId,
  double? total,
  int? transDate,
}) => TransactionModel(  transId: transId ?? this.transId,
  transName: transName ?? this.transName,
  catId: catId ?? this.catId,
  total: total ?? this.total,
  transDate: transDate ?? this.transDate,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TransId'] = transId;
    map['TransName'] = transName;
    map['CatId'] = catId;
    map['Total'] = total;
    map['TransDate'] = transDate;
    return map;
  }

}