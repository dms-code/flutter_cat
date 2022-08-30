import 'package:flutter/widgets.dart';
import 'package:flutter_cat/presenter/gifview_presenter.dart';
import 'package:flutter_cat/ui/widget/injector_widget.dart';
import 'package:flutter_cat/ui/widget/refresh_button.dart';

class GifViewPart extends StatefulWidget {
  const GifViewPart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GifViewPartState();
}

class _GifViewPartState extends State<StatefulWidget> {
  late GifViewPresenter _presenter;
  late Widget _imageView;

  void _refreshGif() {
    setState(() {
      _presenter.isLoading = true;
      _imageView = const Image(
          image: AssetImage("assets/images/cat.gif"), width: 300, height: 200);

      _presenter.getRandomCat().then((gif) => {
            _presenter.isLoading = false,
            if (mounted)
              {
                setState(() {
                  if (!gif.hasError()) {
                    _imageView =
                        Image.memory(gif.getValue()!, width: 300, height: 200);
                  } else {
                    _imageView = const Image(
                        image: AssetImage("assets/images/error.gif"),
                        width: 300,
                        height: 200);
                  }
                })
              }
          });
    });
  }

  @override
  void initState() {
    super.initState();

    _imageView = const Image(image: AssetImage("assets/images/cat.gif"));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshGif();
    });
  }

  @override
  Widget build(BuildContext context) {
    _presenter = InjectorWidget.of(context).gifViewPresenter();

    List<Widget> widgets = [];

    widgets.add(_imageView);
    widgets.add(const SizedBox(height: 50));

    if (!_presenter.isLoading) {
      widgets.add(RefreshButton(onPressed: _refreshGif));
    }

    return Center(
        child: SingleChildScrollView(
      child:
          SizedBox(width: 400, height: 350,
              child:
                Column(children: widgets)),
    ));
  }
}
