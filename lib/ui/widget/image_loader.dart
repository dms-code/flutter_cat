import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class ImageLoader extends StatefulWidget {
  
  final Uint8List? imageData;
  final String? url;
  final Image progressIndicator;
  final Image errorIndicator;
  final bool hasError;

  const ImageLoader(
      {Key? key,
      required this.url,
      this.imageData,
      required this.progressIndicator,
      required this.errorIndicator,
      required this.hasError})
      : super(key: key);

  const ImageLoader.fromMemory(
      {Key? key,
      required this.imageData,
      this.url,
      required this.progressIndicator,
      required this.errorIndicator,
      required this.hasError})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader> {

  late Widget _currentView;
  bool _loaded = false;

  @override
  Widget build(BuildContext context) {
    
    

    if (widget.url != null) {
    
      if (!_loaded) {
        _currentView = widget.progressIndicator;

        http.get(Uri.parse(widget.url!)).then((value) => {
              if (mounted)
                {
                  setState(() {
                    _loaded = true;
                    if (value.statusCode == 200) {
                      _currentView = Image.memory(
                        value.bodyBytes,
                        width: 300,
                        height: 200,
                      );
                    } else {
                      _currentView = widget.errorIndicator;
                    }
                  })
                }
            });
      }
    } else if (widget.imageData != null) {
      _currentView = Image.memory(
        widget.imageData!,
        width: 300,
        height: 200,
      );
    } else if (widget.hasError) {
      _currentView = widget.errorIndicator;
    }
    else{
      _currentView = widget.progressIndicator;
    }

    return _currentView;
  }
}
