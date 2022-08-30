
import 'package:flutter/widgets.dart';

enum UIView { gif, recent, about }

/// The model that holds the Menu information
class CatMenuItem {

    String icon;
    UIView view;
    GestureTapCallback callback;
    bool selected;

    CatMenuItem(this.icon, this.view, this.callback, this.selected);

}