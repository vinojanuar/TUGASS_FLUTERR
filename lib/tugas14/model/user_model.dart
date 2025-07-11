// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Info? info;
  List<Result>? results;

  Welcome({this.info, this.results});

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    info: json["info"] == null ? null : Info.fromJson(json["info"]),
    results:
        json["results"] == null
            ? []
            : List<Result>.from(
              json["results"]!.map((x) => Result.fromJson(x)),
            ),
  );

  Map<String, dynamic> toJson() => {
    "info": info?.toJson(),
    "results":
        results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Info {
  int? count;
  int? pages;
  String? next;
  dynamic prev;

  Info({this.count, this.pages, this.next, this.prev});

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    count: json["count"],
    pages: json["pages"],
    next: json["next"],
    prev: json["prev"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "pages": pages,
    "next": next,
    "prev": prev,
  };
}

class Result {
  int? id;
  String? name;
  Status? status;
  Species? species;
  String? type;
  Gender? gender;
  Location? origin;
  Location? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  Result({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    status: statusValues.map[json["status"]]!,
    species: speciesValues.map[json["species"]]!,
    type: json["type"],
    gender: genderValues.map[json["gender"]]!,
    origin: json["origin"] == null ? null : Location.fromJson(json["origin"]),
    location:
        json["location"] == null ? null : Location.fromJson(json["location"]),
    image: json["image"],
    episode:
        json["episode"] == null
            ? []
            : List<String>.from(json["episode"]!.map((x) => x)),
    url: json["url"],
    created: json["created"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": statusValues.reverse[status],
    "species": speciesValues.reverse[species],
    "type": type,
    "gender": genderValues.reverse[gender],
    "origin": origin?.toJson(),
    "location": location?.toJson(),
    "image": image,
    "episode":
        episode == null ? [] : List<dynamic>.from(episode!.map((x) => x)),
    "url": url,
    "created": created,
  };
}

enum Gender { FEMALE, MALE, UNKNOWN }

final genderValues = EnumValues({
  "Female": Gender.FEMALE,
  "Male": Gender.MALE,
  "unknown": Gender.UNKNOWN,
});

class Location {
  String? name;
  String? url;

  Location({this.name, this.url});

  factory Location.fromJson(Map<String, dynamic> json) =>
      Location(name: json["name"], url: json["url"]);

  Map<String, dynamic> toJson() => {"name": name, "url": url};
}

enum Species { ALIEN, HUMAN }

final speciesValues = EnumValues({
  "Alien": Species.ALIEN,
  "Human": Species.HUMAN,
});

enum Status { ALIVE, DEAD, UNKNOWN }

final statusValues = EnumValues({
  "Alive": Status.ALIVE,
  "Dead": Status.DEAD,
  "unknown": Status.UNKNOWN,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
