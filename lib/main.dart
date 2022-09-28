import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userproject/providers/UserProvider.dart';
import 'package:userproject/view/Screen1.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Screen1(),
      ),
    );
  }
}