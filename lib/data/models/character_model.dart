class CharacterModel {
  final int charId;
  final String name;
  final String birthday;
  final List<String> occupation;
  final String image;
  final List<int> appearance;
  final String nickname;
  final String actorName;
  final String appearedIn;
  final List<int> betterCallSaulAppearance;
  final String status;

  CharacterModel({
    required this.charId,
    required this.name,
    required this.birthday,
    required this.occupation,
    required this.image,
    required this.appearance,
    required this.nickname,
    required this.actorName,
    required this.appearedIn,
    required this.betterCallSaulAppearance,
    required this.status,
  });

  factory CharacterModel.fromjson(Map<String, dynamic> json) {
    return CharacterModel(
      charId: json['char_id'],
      name: json['name'],
      birthday: json['birthday'],
      occupation: List<String>.from(json['occupation']),
      image: json['img'],
      appearance: List<int>.from(json['appearance']),
      nickname: json['nickname'],
      actorName: json['portrayed'],
      appearedIn: json['category'],
      betterCallSaulAppearance: List<int>.from(json['better_call_saul_appearance']),
      status: json['status'],
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