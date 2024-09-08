
import 'package:flutter/material.dart';

import 'widgets/login.dart';

void main(){
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      title: 'Odontología Tu Mejor Sonrisa',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
     );
  }
  
}
