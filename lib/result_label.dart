import 'package:calculator/controllers/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ResultLabel extends StatelessWidget {
  //const ResultLabel({Key? key}) : super(key: key);

  final calculatorCtrl = Get.find<CalculatorController>();

  @override
  Widget build(BuildContext context) {
          return Obx(
            ()=> Container(
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                '${ calculatorCtrl.mathResult }',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 50.0
                  ),

    ),
              ),
            ),
          );
  }
}
