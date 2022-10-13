// Type available in the api CAAS
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_cat/model/cat.dart';


/// A object that represent the CAAS api data model

part 'cataas_dto.g.dart';

enum CataasType { image, gif }

@JsonSerializable(genericArgumentFactories: true)
class CataasDTO {
  String? id;
  String? baseURL;
  String? url;
  CataasType? imageType;
  List<dynamic>? tags;
  String? createdAt;
  String? filter;
  String? label;
  String? tag;
  int? width;
  int? height;

  CataasDTO.filter(this.imageType);

  //Create a instance of [CaasDTO] using the [Cat] data
  CataasDTO.from(Cat cat) {
    url = cat.url;

    switch (cat.type) {
      case CatType.gif:
        imageType = CataasType.gif;
        break;
      case CatType.image:
        imageType = CataasType.image;
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

  //Return a Cat model with DTO data
  Cat toCat(){
    return Cat(
      url: "${baseURL!}${url!}", 
      type: imageType! == CataasType.gif ? CatType.gif : CatType.image,
      tag: tag ?? "",
      label: label ?? ""
    );
  }

  CataasDTO();

  factory CataasDTO.fromJson(Map<String, dynamic> json) => _$CataasDTOFromJson(json);
  
  Map<String, dynamic> toJson() => _$CataasDTOToJson(this);

}
