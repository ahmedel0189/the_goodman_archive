import 'package:flutter/material.dart';
import '../../constants/my_colors.dart';
import '../../data/models/character_model.dart';
import '../widgets/widgets_of_character_details_screen.dart';

class CharacterDetails extends StatelessWidget {
  final CharacterModel selectedCharacter;
  const CharacterDetails({
    super.key,
    required this.selectedCharacter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        physics:
            const AlwaysScrollableScrollPhysics(),
        slivers: [
          WidgetsOfCharacterDetailsScreen()
              .buildSliverAppbar(
                context,
                selectedCharacter,
              ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.fromLTRB(
                  14,
                  14,
                  14,
                  0,
                ),
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.start,
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    WidgetsOfCharacterDetailsScreen()
                        .characterIfo(
                          'First Name : ',
                          selectedCharacter
                              .firstName,
                        ),
                    WidgetsOfCharacterDetailsScreen()
                        .buildDivider(270),
                    WidgetsOfCharacterDetailsScreen()
                        .characterIfo(
                          'Last Name : ',
                          selectedCharacter
                              .lastName,
                        ),
                    WidgetsOfCharacterDetailsScreen()
                        .buildDivider(270),
                    WidgetsOfCharacterDetailsScreen()
                        .characterIfo(
                          'Full Name : ',
                          selectedCharacter
                              .fullName,
                        ),
                    WidgetsOfCharacterDetailsScreen()
                        .buildDivider(270),
                    WidgetsOfCharacterDetailsScreen()
                        .characterIfo(
                          'Family : ',
                          selectedCharacter
                              .family,
                        ),
                    WidgetsOfCharacterDetailsScreen()
                        .buildDivider(300),
                    WidgetsOfCharacterDetailsScreen()
                        .characterIfo(
                          'Title : ',
                          selectedCharacter.title,
                        ),
                    WidgetsOfCharacterDetailsScreen()
                        .buildDivider(300),

                    const SizedBox(height: 600),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
