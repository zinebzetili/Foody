import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/navbar.dart';
import 'package:recipe_app/widgets/search_bar.dart' as MyAppSearchBar; // Importing with a prefix

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key, this.previousScreen}) : super(key: key);

  final Widget? previousScreen;

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  late FocusNode _searchFocusNode; // Declare FocusNode

  @override
  void initState() {
    super.initState();
    _searchFocusNode = FocusNode(); // Initialize FocusNode in initState
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _searchFocusNode.dispose(); // Dispose the FocusNode
    super.dispose();
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyAppSearchBar.SearchBar( // Using the custom SearchBar with the prefix
            onSearch: (String searchTerm) {
              // Implement your search logic here using the searchTerm
              // For example, fetch search results based on searchTerm
            },
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.only(top: 20.0),
            child: const Divider(
              thickness: 4.0,
              height: 1.0,
              color: Color.fromARGB(255, 216, 220, 226),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Change this value to the number of search results
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.access_time), // Clock icon
                  title: Text(
                      'Search Result $index'), // Replace with your search result data
                  trailing: Transform.rotate(
                    angle: 50.14 /
                        100, // Rotating arrow_back icon to point northwest
                    child: const Icon(Icons.arrow_back),
                  ),
                  // You can add more content to ListTile if needed
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        initialIndex: 1,
        onIndexChanged: (index) {
          // Handle index change if needed
        },
      ),
    );
  }
}
