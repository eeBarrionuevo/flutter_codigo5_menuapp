import 'package:flutter/material.dart';

class SearchProductDelegate extends SearchDelegate {


  List<String> names = [
    "Juan",
    "Luis",
    "Carlos",
    "Diana",
    "Susana",
    "Maria",
    "Alejandra",
    "Mariela",
    "Angela",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(
          Icons.close,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: Icon(
        Icons.arrow_back_ios_sharp,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    print("RESULTS: $query");
    return Text("buildResults");
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    List<String> namesSuggestion = names.where((element)=> element.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: namesSuggestion.length,
      itemBuilder: (BuildContext context, int index){
        return ListTile(
          title: Text(namesSuggestion[index]),
        );
      },
    );
  }
}
