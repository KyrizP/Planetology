class PlanetModel {
  int? planetOrder;
  String? name;
  String? description;
  BasicDetails? basicDetails;
  String? source;
  String? wikiLink;
  ImgSrc? imgSrc;
  int? id;
  String? planetImg;

  PlanetModel(
      {this.planetOrder,
      this.name,
      this.description,
      this.basicDetails,
      this.source,
      this.wikiLink,
      this.imgSrc,
      this.id});

  PlanetModel.fromJson(Map<String, dynamic> json) {
    planetOrder = json['planetOrder'];
    name = json['name'];
    description = json['description'];
    basicDetails = json['basicDetails'] != null
        ? BasicDetails.fromJson(json['basicDetails'])
        : null;
    source = json['source'];
    wikiLink = json['wikiLink'];
    imgSrc = json['imgSrc'] != null ? ImgSrc.fromJson(json['imgSrc']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['planetOrder'] = planetOrder;
    data['name'] = name;
    data['description'] = description;
    if (basicDetails != null) {
      data['basicDetails'] = basicDetails!.toJson();
    }
    data['source'] = source;
    data['wikiLink'] = wikiLink;
    if (imgSrc != null) {
      data['imgSrc'] = imgSrc!.toJson();
    }
    data['id'] = id;
    return data;
  }
}

class BasicDetails {
  String? volume;
  String? mass;

  BasicDetails({this.volume, this.mass});

  BasicDetails.fromJson(Map<String, dynamic> json) {
    volume = json['volume'];
    mass = json['mass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['volume'] = volume;
    data['mass'] = mass;
    return data;
  }
}

class ImgSrc {
  String? img;
  String? imgDescription;

  ImgSrc({this.img, this.imgDescription});

  ImgSrc.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    imgDescription = json['imgDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['img'] = img;
    data['imgDescription'] = imgDescription;
    return data;
  }
}
