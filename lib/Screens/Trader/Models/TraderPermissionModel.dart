class TraderPermissionModel {

  final int leverage  ;
  final int maxLeverage  ;
  final int maxPositions  ;
  final int stopOutLevel  ;
  final double maxCredit  ;
  final bool bonus  ;
  final bool tradableBonus ;
  final bool tradePermission ;

  TraderPermissionModel({
    required this.leverage,
    required this.maxLeverage,
    required this.maxPositions,
    required this.stopOutLevel,
    required this.maxCredit,
    required this.bonus,
    required this.tradableBonus,
    required this.tradePermission,
  }) ;

  factory TraderPermissionModel.test(){
    return TraderPermissionModel(
      bonus: false ,
      leverage: 10 ,
      stopOutLevel: 10 ,
      maxLeverage: 100 ,
      maxPositions: 10 ,
      maxCredit: 50 ,
      tradePermission: true ,
      tradableBonus: true ,
    ) ;
  }

}