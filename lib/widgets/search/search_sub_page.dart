import 'package:shipcret/material-theme/common_color.dart';
import 'package:shipcret/widgets/common/common_string.dart';

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchSubPage extends ConsumerStatefulWidget {
  const SearchSubPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchSubPageState();
}

class _SearchSubPageState extends ConsumerState<SearchSubPage> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SafeArea(
        child: Container(
          color: FCommonColor.godic,
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
            minWidth: constraints.maxWidth,
          ),
          child: Column(
            children: [
              _searchBar(),
            ],
          ),
        ),
      );
    });
  }

  Container _searchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        color: FCommonColor.greyYeellowOpacity(0.5),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 10),
            child: const Icon(
              FontAwesome5.search,
              color: FCommonColor.subPrimaryWhite,
              size: 20,
            ),
          ),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: FCommonString.search,
                hintStyle: TextStyle(color: FCommonColor.subPrimaryWhite),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
