import 'package:flutter/material.dart';
import 'package:flutter_cat/model/cat_menu_item.dart';
import 'package:flutter_cat/ui/view/cat_view_part.dart';
import 'package:flutter_cat/ui/view/recent_view_part.dart';
import 'package:logger/logger.dart';
import '../ui/widget/bottom_menu_item.dart';

/// The presenter class used by the main user interface and keeps information about the app menu
class AppViewPresenter extends ChangeNotifier {

  final Logger _logger;

  Widget? _tabContent;
  List<CatMenuItem>? _tabs;
  

  AppViewPresenter(this._logger){
    _tabs = [];
  }

  get tabContent => _tabContent;

  bool menuCreated() => _tabs!.isNotEmpty;

  // Add a new tab item to the bottom bar
  void addTabItem(String icon, UIView view, GestureTapCallback callback, bool isSelected){

    _tabs!.add(CatMenuItem(icon, view, callback, isSelected));

    if(isSelected){
      setTabContent(view);
    }
  }

  // Set the visible content on the content view area
  void setTabContent(UIView view){
      switch(view){
            case UIView.gif:
              _tabContent = const CatViewPart();
              break;
            case UIView.recent:
              _tabContent = const RecentViewPart();
              break;
            case UIView.about:
              _tabContent = Container( width: 300, height: 300, color: Colors.white);
              break;

          }
  }

  // Set the active tab in the bottom menu
  void setTabSelected(UIView view){

     _logger.d("setTabSelected: ${view.index}");

     setTabContent(view);

     _tabs?.forEach((element) {

        if(element.view == view){
          element.selected = true;
        }else{
          element.selected = false;
        }

     });

     notifyListeners();

  }


  // Generate the Bottom Tab Menu widgets
  List<BottomMenuItem> getBottomTabMenu(){

    List<BottomMenuItem> menuItems = [];

    _tabs?.forEach((element) {

      menuItems.add(BottomMenuItem(icon: element.icon, active: element.selected, onTap: element.callback));

    });

    return menuItems;
  }

}