import 'package:bloc/bloc.dart';
import '../../data/models/character_model.dart';
import '../../data/repositories/characters_repositories.dart';

part 'characters_state.dart';

class CharactersCubit
    extends Cubit<CharactersState> {
  final CharactersRepositories
  charactersRepository;
  List<CharacterModel> characters = [];

  CharactersCubit(this.charactersRepository)
    : super(CharactersInitial());

  List<CharacterModel> reciveallCharacters() {
    charactersRepository.getallcharaters().then((
      characters,
    ) {
      emit(
        CharactersLoaded(characters: characters),
      );
      this.characters = characters;
    });

    return characters;
  }
}
