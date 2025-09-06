import 'dart:async';

import 'package:flutter/material.dart';
import 'package:the_goodman_archive/constants/my_colors.dart';
import 'package:the_goodman_archive/data/models/character_model.dart';

class WidgetsOfCharacterDetailsScreen {
  

  Future<Size> getImageSize(String url) async {
    final completer = Completer<Size>();
    final image = Image.network(url);
    image.image
        .resolve(const ImageConfiguration())
        .addListener(
          ImageStreamListener((info, _) {
            completer.complete(
              Size(
                info.image.width.toDouble(),
                info.image.height.toDouble(),
              ),
            );
          }),
        );
    return completer.future;
  }

  Widget buildSliverAppbar(BuildContext context ,CharacterModel selectedCharacter) {
    return FutureBuilder<Size>(
      future: getImageSize(
        selectedCharacter.imageUrl,
      ),
      builder: (context, snapshot) {
        double expandedHeight =
            300; // fallback مؤقت
        if (snapshot.hasData) {
          final size = snapshot.data!;
          final screenWidth = MediaQuery.of(
            context,
          ).size.width;
          // 🔹 احسب الارتفاع بناءً على نسبة أبعاد الصورة
          expandedHeight =
              screenWidth *
              (size.height / size.width);
        }
        return SliverAppBar(
          expandedHeight: expandedHeight,
          pinned: true,
          stretch: true,
          backgroundColor: MyColors.myGrey,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              selectedCharacter.fullName,
              style: TextStyle(
                color: MyColors.myWhite,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            background: Hero(
              tag: selectedCharacter.id,
              child: Image.network(
                selectedCharacter.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
