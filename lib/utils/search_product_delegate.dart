
import 'package:flutter/material.dart';

class SearchProductDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Text("buildActions", style: TextStyle(color: Colors.redAccent,),),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return Text("buildLeading", style: TextStyle(color: Colors.redAccent,),);
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text("buildResults");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Text("buildSuggestions");
  }
  
}