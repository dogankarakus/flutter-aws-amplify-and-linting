// dart async library we will refer to when setting up real time updates

import 'package:flutter/material.dart';
import 'package:flutter_with_aws/screens/TodosPage.dart';
// amplify packages we will need to use
// amplify configuration and models that should have been generated for you

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amplified Todo',
      home: TodosPage(),
    );
  }
}
