import 'package:flutter/widgets.dart';
import 'package:flutter_cat/presenter/gifview_presenter.dart';
import 'package:flutter_cat/ui/widget/InjectorWidget.dart';
import 'package:flutter_cat/ui/widget/refresh_button.dart';

class RecentViewPart extends StatefulWidget {
  const RecentViewPart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RecentViewPartState();
}

class _RecentViewPartState extends State<StatefulWidget> {

  late GifViewPresenter _presenter;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    _presenter = InjectorWidget.of(context).gifViewPresenter();

    List<Image> recentGifs = [];

    _presenter.getRecent().forEach((element) {
      recentGifs.add(Image.network(element.url));
    });

    return Center(
      child: ListView(
        children: recentGifs,
      )
    );
  }
}
