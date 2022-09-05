enum CatType{

  gif,
  image

}

enum CatFilter{

  blur,
  mono,
  sepia,
  negative,
  paint,
  pixel

}

//The domain class that holds data from a cat image
class Cat {

  String? url;
  String? tag;
  String? label;
  CatType type;
  CatFilter? filter;
  int? width;
  int? height;

  Cat({this.url, required this.type});

}