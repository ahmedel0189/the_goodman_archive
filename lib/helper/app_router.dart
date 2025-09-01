import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/string.dart';
import '../data/api/characters_api.dart';
import '../data/repositories/characters_repositories.dart';
import '../logic/cubit/characters_cubit.dart';
import '../ui/screens/character_screen.dart';
import '../ui/screens/character_details.dart';

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
        return MaterialPageRoute(
          builder: (_) => CharacterDetails(),
        );
    }
  }
}
