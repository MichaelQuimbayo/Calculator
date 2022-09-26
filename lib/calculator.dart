import 'package:calculator/button.dart';
import 'package:calculator/controllers/calculator_controller.dart';
import 'package:calculator/providers/theme.dart';
import 'package:calculator/result_label.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';



class Calculator extends StatefulWidget {
  //const Calculator({Key? key}) : super(key: key);



  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  bool light = false;


  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor){
    return Container(
      child: ElevatedButton(
        onPressed: (){},
        child: Text(btntxt,
          style: TextStyle(
            fontSize: 35.0,
            color: txtcolor
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.all(20.0),
          primary: btncolor
        ),
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    final calculatorCtrl = Get.put(CalculatorController());
    //final text = MediaQuery.of(context).platformBrightness== Brightness.dark?'DarkTheme':'LightTheme';
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Calculator'),

        Switch(
          // This bool value toggles the switch.
          value: light,
          onChanged: (bool value) {
            // This is called when the user toggles the switch.
            setState(() {
              light = value;
              light?theme.setTheme(ThemeData.dark()):theme.setTheme(ThemeData.light());
            });

          },)
          ],
        ),

      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //calculator display
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(padding: EdgeInsets.all(10.0),
                  child: ResultLabel()
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //here buttons function will be called
                Button('AC', Colors.grey, Colors.white, ()=>calculatorCtrl.resetAll()),
                Button('+/-', Colors.grey, Colors.white, ()=>calculatorCtrl.changeNegativePositive()),
                Button('del', Colors.grey, Colors.white, ()=>calculatorCtrl.deleteLastEntry()),
                Button('/', Colors.white, Colors.amber.shade700, ()=>calculatorCtrl.selectOperation('/')),
                //here buttons function will be called
                //calcbutton('AC', Colors.grey, Colors.white),
                //calcbutton('+/-', Colors.grey, Colors.white),
                //calcbutton('%', Colors.grey, Colors.white),
               // calcbutton('/', Colors.amber.shade700, Colors.white),
              ],
            ),
            SizedBox(height: 10.0,),
            //now we will copy above row code and mane more rows
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //here buttons function will be called
                Button('7', Colors.white, Colors.grey.shade800, ()=>calculatorCtrl.addNumber('7')),
                Button('8', Colors.white, Colors.grey.shade800, ()=>calculatorCtrl.addNumber('8')),
                Button('9', Colors.white, Colors.grey.shade800, ()=>calculatorCtrl.addNumber('9')),
                Button('X', Colors.white, Colors.amber.shade700, ()=>calculatorCtrl.selectOperation('X')),
              ],
            ),
            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //here buttons function will be called
                Button('4', Colors.white, Colors.grey.shade800, ()=>calculatorCtrl.addNumber('4')),
                Button('5', Colors.white, Colors.grey.shade800, ()=>calculatorCtrl.addNumber('5')),
                Button('6', Colors.white, Colors.grey.shade800, ()=>calculatorCtrl.addNumber('6')),
                Button('-', Colors.white, Colors.amber.shade700, ()=>calculatorCtrl.selectOperation('-')),
              ],
            ),
            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //here buttons function will be called
                Button('3', Colors.white, Colors.grey.shade800, ()=>calculatorCtrl.addNumber('3')),
                Button('2', Colors.white, Colors.grey.shade800, ()=>calculatorCtrl.addNumber('2')),
                Button('1', Colors.white, Colors.grey.shade800, ()=>calculatorCtrl.addNumber('1')),
                Button('+', Colors.white, Colors.amber.shade700, ()=>calculatorCtrl.selectOperation('+')),
              ],
            ),
            SizedBox(height: 10.0,),
            //now last row is different as it has 0 button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //This is button 0
                ElevatedButton(
                  onPressed: ()=>calculatorCtrl.addNumber('0'),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    padding: EdgeInsets.fromLTRB(34.0, 20.0, 128.0, 20.0),
                    primary: Colors.grey.shade800,
                  ),
                    child: Text('0',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white
                      ),
                    ),
                ),
                Button('.', Colors.white, Colors.grey.shade800, ()=>calculatorCtrl.addDecimalPoint()),
                Button('=', Colors.white, Colors.amber.shade700, ()=>calculatorCtrl.calculateResult()),
              ],
            ),
            SizedBox(height: 10.0,),
          ],
        ),
      ),
    );
  }
}
