
import 'package:flutter/material.dart';
import 'package:flutter_cat/ui/view/app_view.dart';
import 'package:flutter_cat/ui/widget/injector_widget.dart';

void main() async {

  //Dependency Injection of Presenters and Services
  InjectorWidget injector = InjectorWidget(child: const MyApp());

  await injector.init();

  runApp(injector);

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'FlutterCat',
      home: AppView(), color: Colors.white,
    );
  }
}