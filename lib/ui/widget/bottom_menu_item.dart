
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomMenuItem extends StatelessWidget{

  final String icon;
  final GestureTapCallback? onTap;
  final bool active;

  const BottomMenuItem({Key? key, required this.icon, this.onTap, required this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Expanded(
        child: GestureDetector(
            onTap: onTap,
            child: SizedBox(
              width: 100,
              height: 100,
              child: Center(
                child: SvgPicture.asset(icon,color: active ? Colors.purple : Colors.grey, width: 32, height: 32,),
            )

          ,)
        )
    );

  }




}