import 'package:elredio_assignment/data_repo/view/main_page.dart';
import 'package:elredio_assignment/data_repo/view_model/screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ///
        ChangeNotifierProvider(
          create: (context) => ScreenViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Elredio Assignment',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  const MainPage(),
      ),
    );
  }
}
