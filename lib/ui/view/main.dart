
import 'package:flutter/material.dart';
import 'package:flutter_cat/presenter/appview_presenter.dart';
import 'package:flutter_cat/presenter/cat_view_presenter.dart';
import 'package:flutter_cat/ui/view/app_view.dart';
import 'package:flutter_cat/util/injector.dart';
import 'package:provider/provider.dart';

void main() async {

  //Dependency Injection of Presenters and Services
  Injector injector = Injector();

  await injector.init();

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<AppViewPresenter>(create: (_) => injector.appViewPresenter),
        ChangeNotifierProvider<CatViewPresenter>(create: (_) => injector.catViewPresenter),
      ],
      child: const MyApp(),
    ),);

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