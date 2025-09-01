import 'package:bloc/bloc.dart';
import 'package:the_goodman_archive/data/models/character_model.dart';
import 'package:the_goodman_archive/data/repositories/characters_repositories.dart';

part 'characters_state.dart';

class CharactersCubit
    extends Cubit<CharactersState> {
  final CharactersRepositories
  charactersRepository;
  List<CharacterModel> characters = [];

  CharactersCubit(this.charactersRepository)
    : super(CharactersInitial());

  Future< List<CharacterModel>> reciveallCharacters()async {
    final characters= await charactersRepository.getallcharaters().then((
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
