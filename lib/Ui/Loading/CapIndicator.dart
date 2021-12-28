import 'package:flutter/material.dart';
import 'package:flutter_app/Ui/Grid/CapTheme.dart';

class CapIndicator extends StatelessWidget {

  @override
  Widget build(BuildContext context) => const Center(
    child: CircularProgressIndicator(
      color: CapTheme.danger,
    ),
  );

}