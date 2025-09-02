// class CharacterModel {
//   late final int charId;
//   late final String name;
//   late final String birthday;
//   late final List<String> occupation;
//   late final String image;
//   late final List<int> appearance;
//   late final String nickname;
//   late final String actorName;
//   late final String appearedIn;
//   late final List<int> betterCallSaulAppearance;
//   late final String status;

//   CharacterModel({
//     required this.charId,
//     required this.name,
//     required this.birthday,
//     required this.occupation,
//     required this.image,
//     required this.appearance,
//     required this.nickname,
//     required this.actorName,
//     required this.appearedIn,
//     required this.betterCallSaulAppearance,
//     required this.status,
//   });

//   factory CharacterModel.fromjson(
//     Map<String, dynamic> json,
//   ) {
//     return CharacterModel(
//       charId: json['char_id'],
//       name: json['name'],
//       birthday: json['birthday'],
//       occupation: List<String>.from(
//         json['occupation'],
//       ),
//       image: json['img'],
//       appearance: List<int>.from(
//         json['appearance'],
//       ),
//       nickname: json['nickname'],
//       actorName: json['portrayed'],
//       appearedIn: json['category'],
//       betterCallSaulAppearance: List<int>.from(
//         json['better_call_saul_appearance'],
//       ),
//       status: json['status'],
//     );
//   }
// }

class CharacterModel {
  final int id;
  final String firstName;
  final String lastName;
  final String fullName;
  final String title;
  final String family;
  final String image;
  final String imageUrl;

  CharacterModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.title,
    required this.family,
    required this.image,
    required this.imageUrl,
  });

  /// Factory constructor from JSON
  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'] ?? 0,
      firstName: json['firstName'] ,
      lastName: json['lastName'] ,
      fullName: json['fullName'] ,
      title: json['title'] ,
      family: json['family'] ,
      image: json['image'] ,
      imageUrl: json['imageUrl'] ,
    );
  }
}