import 'package:flutter/material.dart';
class Button extends StatefulWidget {
  //const Button({Key? key}) : super(key: key);

  String symbol = '';
  Color colorSymbol ;
  Color colorButton ;
  final  onPressed;

  Button(this.symbol, this.colorSymbol, this.colorButton, this.onPressed);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
          onPressed: widget.onPressed,
          child: Text(widget.symbol,
            style: TextStyle(
                fontSize: 28.0,
                color: widget.colorSymbol,
            ),
          ),
          style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(20.0),
              primary: widget.colorButton,
          ),
        )
    );
  }
}
