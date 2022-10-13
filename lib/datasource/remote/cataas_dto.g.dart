// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cataas_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CataasDTO _$CataasDTOFromJson(Map<String, dynamic> json) => CataasDTO()
  ..id = json['id'] as String?
  ..baseURL = json['baseURL'] as String?
  ..url = json['url'] as String?
  ..imageType = $enumDecodeNullable(_$CataasTypeEnumMap, json['imageType'])
  ..tags = json['tags'] as List<dynamic>?
  ..createdAt = json['createdAt'] as String?
  ..filter = json['filter'] as String?
  ..label = json['label'] as String?
  ..tag = json['tag'] as String?
  ..width = json['width'] as int?
  ..height = json['height'] as int?;

Map<String, dynamic> _$CataasDTOToJson(CataasDTO instance) => <String, dynamic>{
      'id': instance.id,
      'baseURL': instance.baseURL,
      'url': instance.url,
      'imageType': _$CataasTypeEnumMap[instance.imageType],
      'tags': instance.tags,
      'createdAt': instance.createdAt,
      'filter': instance.filter,
      'label': instance.label,
      'tag': instance.tag,
      'width': instance.width,
      'height': instance.height,
    };

const _$CataasTypeEnumMap = {
  CataasType.image: 'image',
  CataasType.gif: 'gif',
};
