import '../api/characters_api.dart';
import '../models/character_model.dart';

class CharactersRepositories {
  final CharactersApi charactersApi;

  CharactersRepositories({
    required this.charactersApi,
  });

  Future<List<CharacterModel>> getallcharaters() async {
    // characters list of json map
    final listOfCharacters = await charactersApi
        .getallcharaters();
    // return list of character model
    return listOfCharacters
    // Iterable of maps of character model
        .map(
          (character) =>
              CharacterModel.fromJson(character),
        )
        .toList();
  }
}
