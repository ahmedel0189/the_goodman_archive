import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/character_model.dart';

import '../constants/string.dart';
import '../data/api/characters_api.dart';
import '../data/repositories/characters_repositories.dart';
import '../logic/cubit/characters_cubit.dart';
import '../ui/screens/character_details.dart';
import '../ui/screens/character_screen.dart';

class AppRouter {
  late CharactersRepositories
  charactersRepositories;
  late CharactersCubit charactersCubit;

  AppRouter()
    : charactersRepositories =
          CharactersRepositories(
            charactersApi: CharactersApi(),
          ) {
    charactersCubit = CharactersCubit(
      charactersRepositories,
    );
  }
  // ignore: body_might_complete_normally_nullable
  Route? generaterout(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                charactersCubit,
            child: CharacterScreen(),
          ),
        );
      case characterDetailsScreen:
        // when i click on a character to detils screen it pass the selectedCharacter ,
        // It's own character model to build the character screen according to it
        final selectedCharacter =
            settings.arguments as CharacterModel;
        return MaterialPageRoute(
          builder: (_) => CharacterDetails(
            selectedCharacter: selectedCharacter,
          ),
        );
    }
  }
}
