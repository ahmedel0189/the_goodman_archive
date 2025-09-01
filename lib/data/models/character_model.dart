
class CharacterModel {
  late final int charId;
  late final String name;
  late final String birthday;
  late final List<String> occupation;
  late final String image;
  late final List<int> appearance;
  late final String nickname;
  late final String actorName;
  late final String appeareIn;
  late final List<int> betterCallsaulAppearance;

  CharacterModel({
    required this.charId,
    required this.name,
    required this.birthday,
    required this.occupation,
    required this.image,
    required this.appearance,
    required this.nickname,
    required this.actorName,
    required this.appeareIn,
    required this.betterCallsaulAppearance,
  });

  factory CharacterModel.fromjson(
    Map<String, dynamic>json,
  ) {
    return CharacterModel(
      charId: json['char_id'],
      name: json['name'],
      birthday: json['birthday'],
      occupation: json['occupation'],
      image: json['img'],
      appearance: json['appearance'],
      nickname: json['nickname'],
      actorName: json['portrayed'],
      appeareIn: json['category'],
      betterCallsaulAppearance: json['better_call_saul_appearance'],
    );
  }
}

    // {
    //     "char_id": 1,
    //     "name": "Walter White",
    //     "birthday": "09-07-1958",
    //     "occupation": [
    //         "High School Chemistry Teacher",
    //         "Meth King Pin"
    //     ],
    //     "img": "amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg",
    //     "status": "Deceased",
    //     "appearance": [
    //         1,
    //         2,
    //         3,
    //         4,
    //         5
    //     ],
    //     "nickname": "Heisenberg",
    //     "portrayed": "Bryan Cranston",
    //     "category": "Breaking Bad",
    //     "better_call_saul_appearance": []
    // },