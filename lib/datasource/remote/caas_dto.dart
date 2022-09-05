// Type available in the api CAAS
import 'package:flutter_cat/model/cat.dart';

enum CaasType { image, gif }

/// A object that represent the CAAS api data model
class CaasDTO {
  String? id;
  String? url;
  CaasType? imageType;
  List<dynamic>? tags;
  String? createdAt;
  String? filter;
  String? label;
  String? tag;
  int? width;
  int? height;

  CaasDTO.filter(this.imageType);

  //Create a instance of [CaasDTO] using the [Cat] data
  CaasDTO.from(Cat cat) {
    url = cat.url;

    switch (cat.type) {
      case CatType.gif:
        imageType = CaasType.gif;
        break;
      case CatType.image:
        imageType = CaasType.image;
        break;
    }

    tag = cat.tag;
    label = cat.label;
    width = cat.width;
    height = cat.height;

    if(cat.filter != null) {
      switch (cat.filter!) {
        case CatFilter.blur:
          filter = "blur";
          break;
        case CatFilter.mono:
          filter = "mono";
          break;
        case CatFilter.negative:
          filter = "negative";
          break;
        case CatFilter.paint:
          filter = "paint";
          break;
        case CatFilter.pixel:
          filter = "pixel";
          break;
        case CatFilter.sepia:
          filter = "sepia";
          break;
        default:
          break;
      }
    }
  }

  CaasDTO(Map jsonData) {
    id = jsonData["id"];
    url = jsonData["url"];
    imageType = jsonData["type"];
    tags = jsonData["tags"];
    createdAt = jsonData["createdAt"];
  }
}
