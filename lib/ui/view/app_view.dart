import 'package:flutter/material.dart';
import 'package:flutter_cat/model/cat_menu_item.dart';
import 'package:flutter_cat/presenter/appview_presenter.dart';
import 'package:flutter_cat/ui/widget/injector_widget.dart';

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppViewState();

}

class _AppViewState extends State<StatefulWidget>{

  late AppViewPresenter _presenter;
  int bottomMenuSize = 105;

  void _showGifView(){
    setState(() {
      _presenter.setMenuSelected(UIView.gif);
    });
  }

  void _showListGifView(){
    setState(() {
      _presenter.setMenuSelected(UIView.recent);
    });
  }

  @override
  Widget build(BuildContext context) {

    _presenter = InjectorWidget.of(context).appViewPresenter();

    if(!_presenter.menuCreated()){
      _presenter.addMenuItem("assets/images/cat.svg", UIView.gif, _showGifView, true);
      _presenter.addMenuItem("assets/images/list.svg", UIView.recent, _showListGifView, false);
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
              child: _presenter.getCurrentView(),
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
                   children: _presenter.getMenu()),
             )
        ]));
          
      }

}