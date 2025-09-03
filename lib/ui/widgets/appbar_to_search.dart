import 'package:flutter/material.dart';
import '../../constants/my_colors.dart';
import '../../data/models/character_model.dart';

// ignore: must_be_immutable
class AppbarToSearch extends StatefulWidget
    implements PreferredSizeWidget {
  List<CharacterModel> allcharacters = [];
  final Function(List<CharacterModel>) onSearch; // الكولباك

  AppbarToSearch({
    super.key,
    required this.allcharacters, required this.onSearch,
  });

  @override
  State<AppbarToSearch> createState() =>
      _AppbarToSearchState();

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight);
}

class _AppbarToSearchState
    extends State<AppbarToSearch> {
  late List<CharacterModel> searchedForCharacter;
  bool issearching = false;
  final _controller = TextEditingController();

  Widget buildSearchFiled() {
    return TextField(
      controller: _controller,
      cursorColor: MyColors.myGrey,
      decoration: InputDecoration(
        hintText: 'Find Your Character...',
        hintStyle: TextStyle(
          color: MyColors.myGrey,
          fontSize: 18,
        ),
        border: InputBorder.none,
      ),
      style: TextStyle(
        color: MyColors.myGrey,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      onChanged: (searchedCharacter) {
        addsearchedForitemsToSearchedList(
          searchedCharacter,
        );
      },
    );
  }

  addsearchedForitemsToSearchedList(
    String searchedCharacter,
  ) {
    searchedForCharacter = widget.allcharacters
        .where(
          (character) => character.fullName
              .toLowerCase()
              .contains(
                searchedCharacter.toLowerCase(),
              ),
        )
        .toList();
  widget.onSearch(searchedForCharacter); // 👈 هنا التعديل
    setState(() {});
  }

  List<Widget> buildAppBarActions() {
    if (issearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.clear,
            color: MyColors.myGrey,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: Icon(
            Icons.search,
            color: MyColors.myGrey,
          ),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!.addLocalHistoryEntry(
      LocalHistoryEntry(onRemove: _stopSearching),
    );

    setState(() {
      issearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();

    setState(() {
      issearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _controller.clear();
    });
      widget.onSearch(widget.allcharacters); // 👈 رجع كل الشخصيات
  }

  
  Widget buildAppBarTitle() {
    return Text(
      'Characters',
      style: TextStyle(
        color: MyColors.myGrey,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: issearching
          ? BackButton(color: MyColors.myGrey)
          : Container(),
      title: issearching
          ? buildSearchFiled()
          : buildAppBarTitle(),
      actions: buildAppBarActions(),
      backgroundColor: MyColors.myYellow,
    );
  }
}
