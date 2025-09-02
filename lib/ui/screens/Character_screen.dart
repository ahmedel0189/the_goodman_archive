import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_goodman_archive/constants/my_colors.dart';
import 'package:the_goodman_archive/logic/cubit/characters_cubit.dart';
import 'package:the_goodman_archive/ui/widgets/character_card.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() =>
      _CharacterScreenState();
}

class _CharacterScreenState
    extends State<CharacterScreen> {
  List<dynamic> allcharacters = [];

  @override
  void initState() {
    super.initState();
    // Load characters when the screen initializes
    allcharacters =
        BlocProvider.of<CharactersCubit>(
          context,
        ).reciveallCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<
      CharactersCubit,
      CharactersState
    >(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allcharacters = state.characters;
          return buildLoadedWidget();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildLoadedWidget() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [buildCharactersList()],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 1,
          ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allcharacters.length,
      itemBuilder: (context, index) {
        return CharacterCard(
          characterModel: allcharacters[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Characters',
          style: TextStyle(
            color: MyColors.myGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: MyColors.myYellow,
      ),
      body: buildBlocWidget(),
    );
  }
}
