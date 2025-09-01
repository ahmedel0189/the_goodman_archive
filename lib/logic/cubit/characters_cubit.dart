import 'package:bloc/bloc.dart';
import '../../data/models/character_model.dart';
import '../../data/repositories/characters_repositories.dart';

part 'characters_state.dart';

class CharactersCubit
    extends Cubit<CharactersState> {
  final CharactersRepositories
  charactersRepositories;
  late List<CharacterModel> characters;
  CharactersCubit(this.charactersRepositories)
    : super(CharactersInitial());

  List<CharacterModel> reciveallCharacters() {
    charactersRepositories.getallcharaters().then(
      (characters) {
        emit(
          CharactersLoaded(
            characters: characters,
          ),
        );
        this.characters = characters;
      },
    );
    return characters;
  }
}
