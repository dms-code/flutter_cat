import 'package:flutter/material.dart';
import 'package:flutter_cat/model/cat_menu_item.dart';
import '../ui/widget/bottom_menu_item.dart';

class AppViewPresenter {

  List<CatMenuItem>? _items;

  AppViewPresenter(){
    _items = [];
  }

  void addMenuItem(String icon, UIView view, GestureTapCallback callback, bool isSelected){

    _items!.add(CatMenuItem(icon, view, callback, isSelected));

  }

  Widget getCurrentView(){

     CatMenuItem selectedItem = _items!.firstWhere((element) => element.selected == true);

     switch(selectedItem.view){
       case UIView.gif:
         return Center(child: Container( width: 300, height: 300, color: Colors.red));
       case UIView.giflist:
         return Container( width: 300, height: 300, color: Colors.white);
       case UIView.about:
         return Container( width: 300, height: 300, color: Colors.white);

     }

  }

  void setMenuSelected(UIView view){

     _items?.forEach((element) {
       if(element.view == view){
         element.selected = true;
       }
       else
       {
         element.selected = false;
       }
     });

  }

  List<BottomMenuItem> getMenu(){

    List<BottomMenuItem> menuItems = [];

    _items?.forEach((element) {

      menuItems.add(BottomMenuItem(icon: element.icon, active: element.selected, onTap: element.callback));

    });

    return menuItems;
  }

}