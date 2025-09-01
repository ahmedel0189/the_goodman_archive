import 'package:flutter/material.dart';
import 'package:the_goodman_archive/constants/my_colors.dart';
import 'package:the_goodman_archive/data/models/character_model.dart';

class CharacterCard extends StatelessWidget {
  final CharacterModel characterModel;
  const CharacterCard({
    super.key,
    required this.characterModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(
        8,
        8,
        8,
        8,
      ),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child:Text(characterModel.actorName,style: 
          TextStyle(color:MyColors.myWhite,
          height: 1.3,
          fontSize: 16),
          overflow:  TextOverflow.ellipsis,maxLines: 2,
          textAlign: TextAlign.center,)
        ),
        child: Container(
          child: characterModel.image.isNotEmpty
              ? FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  placeholder:
                      'assets/images/loading.gif',
                  image: characterModel.image,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  'assets/images/Empty.gif',
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
