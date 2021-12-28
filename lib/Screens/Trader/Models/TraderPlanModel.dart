class TraderPlanModel {

  final int id  ;
  final String name  ;
  final String type  ;
  final String color  ;

  TraderPlanModel({
    required this.id,
    required this.name,
    required this.type,
    required this.color,
  }) ;

  factory TraderPlanModel.test(){
    return TraderPlanModel(
      id: 1 ,
      name: "Classic" ,
      type: "real",
      color: "success" ,
    );
  }
}