import 'package:flutter_cat/presenter/appview_presenter.dart';
import 'package:flutter_cat/presenter/cat_view_presenter.dart';
import 'package:flutter_cat/ui/view/cat_view_part.dart';
import 'package:flutter_cat/ui/view/main.dart';
import 'package:flutter_cat/ui/widget/bottom_menu_item.dart';
import 'package:flutter_cat/util/injector.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
    testWidgets('Test the main AppView', (tester) async {

      Injector injector = Injector();
      
      await injector.init();

      await tester.pumpWidget(MultiProvider(
          providers: [
            ChangeNotifierProvider<AppViewPresenter>(create: (_) => injector.appViewPresenter),
            Provider<CatViewPresenter>(create: (_) => injector.catViewPresenter),
          ],
          child: const MyApp(),
      ));

      final gifView = find.byType(CatViewPart);
      final menu = find.byType(BottomMenuItem);

      expect(gifView, findsOneWidget);
      expect(menu, findsWidgets);
      
    });
}
