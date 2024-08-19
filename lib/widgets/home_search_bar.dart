import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key, required this.onSearch}) : super(key: key);

  final Function(String) onSearch;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _textEditingController = TextEditingController();
  late FocusNode _searchFocusNode;

  @override
  void initState() {
    super.initState();
    _searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 20,
        left: 1,
      ),
      child: Row(
        children: [
         
          Container(
            padding: const EdgeInsets.fromLTRB(0, 1.0, 16.0, 1.0),
            width: 250,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 216, 220, 226),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.search),
                  color: Colors.grey,
                  onPressed: () {
                    FocusScope.of(context).requestFocus(_searchFocusNode);
                  },
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    focusNode: _searchFocusNode,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: -10),
                      hintText: 'Search recipes...',
                      border: InputBorder.none,
                    ),
                    onSubmitted: widget.onSearch,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    _textEditingController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
