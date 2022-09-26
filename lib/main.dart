
import 'package:calculator/calculator.dart';
import 'package:flutter/material.dart';
import 'package:calculator/providers/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return ChangeNotifierProvider(create: (BuildContext context)=>ThemeChanger(ThemeData.light(),
     ),
     child: MaterialAppWithTheme(),
     );
  }
  
}
class MaterialAppWithTheme extends StatelessWidget {
  //const MaterialAppWithTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      theme: theme.getTheme(),
      home: Calculator(),
    );
  }
}
