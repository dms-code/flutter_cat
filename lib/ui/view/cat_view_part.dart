import 'package:flutter/material.dart';
import 'package:flutter_cat/presenter/cat_view_presenter.dart';
import 'package:flutter_cat/ui/widget/injector_widget.dart';
import 'package:flutter_cat/ui/widget/refresh_button.dart';
import '../../model/cat.dart';

class CatViewPart extends StatefulWidget {
  const CatViewPart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CatViewPartState();
}

class _CatViewPartState extends State<StatefulWidget> {
  late CatViewPresenter _presenter;
  late Widget _imageView;
  bool hasError = false;

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
                hasError = false;
                _imageView =
                    Image.memory(gif.getValue()!, width: 300, height: 200);
              } else {
                hasError = true;
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
    _presenter = InjectorWidget.of(context).catViewPresenter();

    List<Widget> widgets = [];

    widgets.add(_imageView);
    widgets.add(const SizedBox(height: 50));

    if ((!_presenter.isLoading && _presenter.getRecent().isNotEmpty) || hasError) {
      Cat cat = _presenter.getFilter();

      // Image Type selector
      widgets.add(Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text("Only Gif"),
        Checkbox(
            activeColor: Colors.purple,
            value: cat.type == CatType.gif,
            onChanged: (bool? newValue) {
              setState(() {
                Cat cat = _presenter.getFilter();
                cat.type = newValue! ? CatType.gif : CatType.image;
                _presenter.setFilter(cat);
              });
            })
      ]));

      // Tag filter
      TextEditingController tagController = TextEditingController();

      if (cat.tag != null) {
        tagController.text = cat.tag!;
        tagController.selection = TextSelection.fromPosition(
          TextPosition(offset: cat.tag!.length),
        );
      }

      widgets.add(Container(
          padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
          child: TextField(
            cursorColor: Colors.purple,
            controller: tagController,
            onChanged: (String value) {
              setState(() {
                Cat cat = _presenter.getFilter();
                cat.tag = value;
                _presenter.setFilter(cat);
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Tag',
              floatingLabelStyle: TextStyle(color: Colors.purple),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.purple),

              )
            ),
          )));

      // Label filter
      TextEditingController labelController = TextEditingController();

      if (cat.label != null) {
        labelController.text = cat.label!;
        labelController.selection = TextSelection.fromPosition(
          TextPosition(offset: cat.label!.length),
        );
      }

      widgets.add(Container(
          padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
          child: TextField(
            cursorColor: Colors.purple,
            controller: labelController,
            onChanged: (String value) {
              setState(() {
                Cat cat = _presenter.getFilter();
                cat.label = value;
                _presenter.setFilter(cat);
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Label',
              floatingLabelStyle: TextStyle(color: Colors.purple),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.purple),
              )
            ),
          )));

      widgets.add(RefreshButton(onPressed: _refreshGif));
    }

    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
              child:
              Center(child: Column(children: widgets)),
            )));
  }
}
