import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../constants/my_colors.dart';
import '../../data/models/character_model.dart';
import '../../logic/cubit/characters_cubit.dart';
import '../widgets/appbar_to_search.dart';
import '../widgets/widgets_of_character_screen.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() =>
      _CharacterScreenState();
}

class _CharacterScreenState
    extends State<CharacterScreen> {
  List<CharacterModel> allcharacters = [];
  List<CharacterModel> searchedForCharacter =
      []; // todo
  @override
  void initState() {
    super.initState();
    // Load characters when the screen initializes
    BlocProvider.of<CharactersCubit>(
      context,
    ).reciveallCharacters();
  }

  // ? build character screen
  Widget buildBlocWidget() {
    return BlocBuilder<
      CharactersCubit,
      CharactersState
    >(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allcharacters = state.characters;
          // لو مفيش بحث، اعرض الكل
          final charactersToShow =
              searchedForCharacter.isEmpty
              ? allcharacters
              : searchedForCharacter;
          return WidgetsOfCharacterScreen(
            charactersToShow,
          ).buildLoadedWidget();
        } else {
          return WidgetsOfCharacterScreen()
              .showLoadingIndicator();
        }
      },
    );
  }

  void updateSearchedCharacters(
    List<CharacterModel> characters,
  ) {
    setState(() {
      searchedForCharacter = characters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      appBar: AppbarToSearch(
        allcharacters: allcharacters,
        onSearch: updateSearchedCharacters, // 👈
      ),
      body: OfflineBuilder(
        connectivityBuilder:
            (
              BuildContext context,
              List<ConnectivityResult>
              connectivity,
              Widget child,
            ) {
              final bool connected = !connectivity
                  .contains(
                    ConnectivityResult.none,
                  );
              if (connected) {
                return buildBlocWidget();
              } else {
                return WidgetsOfCharacterScreen()
                    .buildNoInternetWidget();
              }
            },
        child: WidgetsOfCharacterScreen()
            .showLoadingIndicator(),
      ),
    );
  }
}
