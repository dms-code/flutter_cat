import 'package:flutter/material.dart';
import 'package:flutter_cat/ui/view/gif_view_part.dart';
import 'package:flutter_cat/ui/widget/injector_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
    testWidgets('Test the GifView', (tester) async {

      InjectorWidget injector = InjectorWidget(child: const MaterialApp(home: GifViewPart()));

      await injector.init();

      await tester.pumpWidget(injector);

      var refButton = find.byType(Image);
      
      expect(refButton, findsOneWidget);


    });
}
