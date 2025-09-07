import 'package:flutter/material.dart';
import '../../constants/my_colors.dart';
import '../../data/models/character_model.dart';
import 'character_card.dart';

class WidgetsOfCharacterScreen {
  List<CharacterModel> allcharacters = [];
  WidgetsOfCharacterScreen([
    this.allcharacters = const [],
  ]);

  //ToDo: build character screen

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
          children: [
            buildCharactersList(
              characters: allcharacters,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList({
    required List<CharacterModel> characters,
  }) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
          ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: characters.length,
      itemBuilder: (context, index) {
        return CharacterCard(
          characterModel: characters[index],
        );
      },
    );
  }

  Widget buildNoInternetWidget() {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Can\'t connect .. check internet',
              style: TextStyle(
                fontSize: 22,
                color: MyColors.myGrey,
              ),
            ),
            Image.asset(
              'assets/images/no_internet.png',
            ),
          ],
        ),
      ),
    );
  }
}
