import 'package:flutter/material.dart';
import 'package:flutter_cat/presenter/appview_presenter.dart';
import 'package:flutter_cat/presenter/cat_view_presenter.dart';
import 'package:flutter_cat/ui/view/cat_view_part.dart';
import 'package:flutter_cat/ui/widget/image_loader.dart';
import 'package:flutter_cat/util/injector.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
    testWidgets('Test the GifView', (tester) async {

      Injector injector = Injector();
      
      await injector.init();

      await tester.pumpWidget(MultiProvider(
          providers: [
            ChangeNotifierProvider<AppViewPresenter>(create: (_) => injector.appViewPresenter),
            ChangeNotifierProvider<CatViewPresenter>(create: (_) => injector.catViewPresenter),
          ],
          child: const MaterialApp(home: CatViewPart()),
      ));

      

      var refButton = find.byType(ImageLoader);
      
      expect(refButton, findsNothing);


    });
}
