import 'package:flutter/material.dart';
import 'package:flutter_cat/presenter/cat_view_presenter.dart';
import 'package:flutter_cat/ui/widget/image_loader.dart';
import 'package:flutter_cat/ui/widget/refresh_button.dart';
import 'package:provider/provider.dart';
import '../../model/cat.dart';

class CatViewPart extends StatefulWidget {
  const CatViewPart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CatViewPartState();
}

class _CatViewPartState extends State<StatefulWidget> {

  final Image _progressIndicator = const Image(image: AssetImage("assets/images/cat.gif"), width:300, height: 200,);
  final Image _errorIndicator = const Image(image: AssetImage("assets/images/error.gif"), width:300, height: 200,);

  void _refreshGif() {
    CatViewPresenter presenter = context.read<CatViewPresenter>();
    presenter.getRandomCat();
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshGif();
    });
  }

  @override
  Widget build(BuildContext context) {

  
    CatViewPresenter presenter = context.read<CatViewPresenter>();
    bool? isLoading = context.watch<CatViewPresenter>().isLoading;

    List<Widget> widgets = [];

    if (isLoading != null) {
      if (isLoading) {
        widgets.add(ImageLoader.fromMemory(
            imageData: null,
            progressIndicator: _progressIndicator,
            errorIndicator: _errorIndicator,
            hasError: false));

        widgets.add(const SizedBox(height: 50));
      } else {
        widgets.add(ImageLoader.fromMemory(
            imageData: presenter.imageRawData,
            progressIndicator:_progressIndicator,
            errorIndicator: _errorIndicator,
            hasError: presenter.errorMessage?.isNotEmpty ?? false));

        widgets.add(const SizedBox(height: 50));

        // Image Type selector
        widgets.add(Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("Only Gif"),
          Checkbox(
              activeColor: Colors.purple,
              value: presenter.getType == CatType.gif,
              onChanged: (bool? newValue) {
                setState(() {
                  presenter.setImageType(newValue!);
                });
              })
        ]));

        // Tag filter
        TextEditingController tagController = TextEditingController();

        String? tag = presenter.getTag;

        if (tag != null) {
          tagController.text = tag;
          tagController.selection = TextSelection.fromPosition(
            TextPosition(offset: tag.length),
          );
        }

        widgets.add(Container(
            padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
            child: TextField(
              cursorColor: Colors.purple,
              controller: tagController,
              onChanged: (String value) {
                setState(() {
                  presenter.setTag(value);
                });
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tag',
                  floatingLabelStyle: TextStyle(color: Colors.purple),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.purple),
                  )),
            )));

        // Label filter
        TextEditingController labelController = TextEditingController();

        String? label = presenter.getLabel;

        if (label != null) {
          labelController.text = label;
          labelController.selection = TextSelection.fromPosition(
            TextPosition(offset: label.length),
          );
        }

        widgets.add(Container(
            padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
            child: TextField(
              cursorColor: Colors.purple,
              controller: labelController,
              onChanged: (String value) {
                setState(() {
                  presenter.setLabel(value);
                });
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Label',
                  floatingLabelStyle: TextStyle(color: Colors.purple),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.purple),
                  )),
            )));

        widgets.add(RefreshButton(onPressed: _refreshGif));
      }
    }

    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
      child: Center(child: Column(children: widgets)),
    )));
  }
}
