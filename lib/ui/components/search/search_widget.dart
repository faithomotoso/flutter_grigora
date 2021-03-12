import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grigora/utils/utils.dart';

class SearchWidget extends StatefulWidget {
  final String searchHint;
  final Function(String query) onEditingComplete;

  SearchWidget({@required this.searchHint, @required this.onEditingComplete});

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController searchController = TextEditingController();


  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: bodyPadding.copyWith(left: 40, right: 40),
      child: TextFormField(
        controller: searchController,
        onEditingComplete: () {
          widget.onEditingComplete?.call(searchController.text);
        },
        decoration: InputDecoration(
          hintText: widget.searchHint ?? "",
          isDense: true,
          suffixIcon: Icon(CupertinoIcons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
          )
        ),
      ),
    );
  }
}
