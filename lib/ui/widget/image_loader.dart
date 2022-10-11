import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class ImageLoader extends StatefulWidget {
  
  final Uint8List? imageData;
  final String? url;
  final Image progressIndicator;
  final Image errorIndicator;
  final bool? hasError;

  const ImageLoader(
      {Key? key,
      required this.url,
      this.imageData,
      required this.progressIndicator,
      required this.errorIndicator,
      this.hasError})
      : super(key: key);

  const ImageLoader.fromMemory(
      {Key? key,
      required this.imageData,
      this.url,
      required this.progressIndicator,
      required this.errorIndicator,
      this.hasError})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader> {
  bool _loaded = false;

  @override
  Widget build(BuildContext context) {
    if (widget.url != null) {
      if (!_loaded) {
        Widget currentView = widget.progressIndicator;

        http.get(Uri.parse(widget.url!)).then((value) => {
              if (mounted)
                {
                  setState(() {
                    _loaded = true;
                    if (value.statusCode == 200) {
                      currentView = Image.memory(
                        value.bodyBytes,
                        width: 300,
                        height: 200,
                      );
                    } else {
                      currentView = widget.errorIndicator;
                    }
                  })
                }
            });

        return currentView;
      }
    } else if (widget.imageData != null) {
      return Image.memory(
        widget.imageData!,
        width: 300,
        height: 200,
      );
    } else if (widget.hasError!) {
      return widget.errorIndicator;
    }

    return widget.progressIndicator;
  }
}
