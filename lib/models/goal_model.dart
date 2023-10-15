/// GoalId : 1
/// SpentLimit : 200.2
/// GoalDate : 1234212
/// CatId : 2

class GoalModel {
  GoalModel({
      this.goalId, 
      this.spentLimit, 
      this.goalDate, 
      this.catId,});

  GoalModel.fromJson(dynamic json) {
    goalId = json['GoalId'];
    spentLimit = json['SpentLimit'];
    goalDate = json['GoalDate'];
    catId = json['CatId'];
  }
  int? goalId;
  double? spentLimit;
  int? goalDate;
  int? catId;
GoalModel copyWith({  int? goalId,
  double? spentLimit,
  int? goalDate,
  int? catId,
}) => GoalModel(  goalId: goalId ?? this.goalId,
  spentLimit: spentLimit ?? this.spentLimit,
  goalDate: goalDate ?? this.goalDate,
  catId: catId ?? this.catId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['GoalId'] = goalId;
    map['SpentLimit'] = spentLimit;
    map['GoalDate'] = goalDate;
    map['CatId'] = catId;
    return map;
  }

}