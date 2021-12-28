import 'package:flutter/material.dart';
import 'package:flutter_app/Ui/Grid/CapTheme.dart';

class CapButton extends StatelessWidget {

  final VoidCallback? onPressed ;
  final String text ;
  final Color color  ;
  final bool loading ;
  final bool rounded ;

  // default stateless
  CapButton({
      Key? key,
      required this.text ,
      required this.onPressed ,
      this.color = CapTheme.danger ,
      this.rounded = true ,
  }) :
      loading = false ,
      super(key: key) ;

  // use this for stateFull button
  CapButton.stateFull({
    Key? key,
    required this.text ,
    required this.onPressed ,
    required this.loading ,
    this.rounded = true ,
    this.color = CapTheme.danger ,
  }) :
      super(key: key) ;

  get _enableButtonStyle => ElevatedButton.styleFrom(
    textStyle : CapTheme.textButtonStyle ,
    primary : color,
    padding: const EdgeInsets.symmetric( vertical: 10 ),
    shape: rounded ? const StadiumBorder() : null  ,
  ) ;

  get _disableButtonStyle => ElevatedButton.styleFrom(
    textStyle : CapTheme.textButtonStyle ,
    primary : CapTheme.secondary ,
    padding: const EdgeInsets.symmetric( vertical: 10 ),
    shape: rounded ? const StadiumBorder() : null  ,
  ) ;

  Widget _loadingIndicator() => const SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator( strokeWidth: 1 ,color: CapTheme.white ,  )
  ) ;

  Widget _button() => ElevatedButton(
    onPressed: loading ? null : onPressed  ,
    style: loading ? _disableButtonStyle : _enableButtonStyle ,
    child: loading ? _loadingIndicator() : Text( text ),
  ) ;

  @override
  Widget build(BuildContext context) => _button() ;

}


// class CapButtonStateFull extends StatefulWidget {
//
//   CapButtonStateFull({ Key? key }) : super(key: key);
//
//   @override
//   CapButtonStateFullState createState() => CapButtonStateFull();
// }
//
// class CapButtonStateFullState extends State<CapButtonStateFull> {
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
//
// }