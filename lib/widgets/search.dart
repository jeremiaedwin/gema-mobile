import 'package:flutter/material.dart';
import '../main.dart';

class CustomSearchDelegate extends SearchDelegate{
  List<String> searchTerms = [
    "Makanan",
    "Minuman",
    "Pakaian"
  ];
  @override
  List<Widget> buildActions(BuildContext context){
    return [
      IconButton(
      icon: const Icon(Icons.clear),
      onPressed: (){
        query = '';
      },
    ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context){
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context){
    List<String> matchQuery = [];
    for(var item in searchTerms){
      if(item.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
  
  @override
  Widget buildSuggestions(BuildContext context){
    List<String> matchQuery = [];
    for(var item in searchTerms){
      if(item.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
