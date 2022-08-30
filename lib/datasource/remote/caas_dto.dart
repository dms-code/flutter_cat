
// Type available in the api CAAS
enum CaasType{
  image,
  gif
}


/// A object that represent the CAAS api data model
class CaasDTO {

  String? id;
  String? url;
  CaasType? type;
  List<dynamic>? tags;
  String? createdAt;

  CaasDTO.filter(this.type);

  CaasDTO(Map jsonData){
    id = jsonData["id"];
    url = jsonData["url"];
    type = jsonData["type"];
    tags = jsonData["tags"];
    createdAt = jsonData["createdAt"];
  }
}