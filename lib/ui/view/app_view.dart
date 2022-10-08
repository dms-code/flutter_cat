import 'package:flutter/material.dart';
import 'package:flutter_cat/model/cat_menu_item.dart';
import 'package:flutter_cat/presenter/appview_presenter.dart';

import 'package:provider/provider.dart';

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppViewState();

}

class _AppViewState extends State<StatefulWidget>{

  int bottomMenuSize = 105;

  @override
  Widget build(BuildContext context) {

    var presenter = context.read<AppViewPresenter>();

    if(!presenter.menuCreated()){
      presenter.addTabItem("assets/images/cat.svg", UIView.gif, () => presenter.setTabSelected(UIView.gif), true);
      presenter.addTabItem("assets/images/list.svg", UIView.recent, () => presenter.setTabSelected(UIView.recent), false);
    }

    var size = MediaQuery.of(context).size;

    return Container(
          width: size.width,
          height: size.height,
          color: Colors.white,
          child: Column(  
            children: [
             Container(
              height: size.height - bottomMenuSize,
              color: Colors.white,
              child: context.watch<AppViewPresenter>().tabContent,
             ),
             Container(
               decoration: const BoxDecoration(
                 border: Border(
                   top: BorderSide(width: 1.0, color: Colors.black12),
                 ),
               ),
               child: Row(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   mainAxisAlignment: MainAxisAlignment.end,
                   textDirection: TextDirection.ltr,
                   children: presenter.getBottomTabMenu()),
             )
        ]));
          
      }

}