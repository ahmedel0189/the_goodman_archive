part of 'characters_cubit.dart'; // explain this chat gpt

// @immutable
sealed class CharactersState {} // and this sealed

final class CharactersInitial
    extends CharactersState {} // and this final

final class CharactersLoaded
    extends CharactersState {
  CharactersLoaded({required this.characters});
  List<CharacterModel> characters;
}

final class CharactersErrorCase
    extends CharactersState {}
