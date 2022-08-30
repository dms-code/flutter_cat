import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class ImageLoader extends StatefulWidget {

  String url;
  Image progressIndicator;
  Image errorIndicator;

  ImageLoader({Key? key, required this.url, required this.progressIndicator, required this.errorIndicator}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader> {

  late Widget _currentView;
  bool _loaded = false;

      @override
      Widget build(BuildContext context) {

         if(!_loaded) {
            _currentView = widget.progressIndicator;

            http.get(Uri.parse(widget.url)).then((value) =>
            {
              if(mounted){
                setState(() {
                  _loaded = true;
                  if (value.statusCode == 200) {
                    _currentView =
                        Image.memory(value.bodyBytes, width: 300, height: 200,);
                  }
                  else {
                    _currentView = widget.errorIndicator;
                  }
                })
              }
            });
         }

         return _currentView;
      }

}
