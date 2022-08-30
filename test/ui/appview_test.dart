import 'package:flutter/material.dart';
import 'package:flutter_cat/ui/view/app_view.dart';
import 'package:flutter_cat/ui/view/gif_view_part.dart';
import 'package:flutter_cat/ui/widget/bottom_menu_item.dart';
import 'package:flutter_cat/ui/widget/injector_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
    testWidgets('Test the main AppView', (tester) async {

      InjectorWidget injector = InjectorWidget(child: const MaterialApp(home: AppView()));

      await injector.init();

      await tester.pumpWidget(injector);

      final gifView = find.byType(GifViewPart);
      final menu = find.byType(BottomMenuItem);

      expect(gifView, findsOneWidget);
      expect(menu, findsWidgets);
      
    });
}
