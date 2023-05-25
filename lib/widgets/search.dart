import 'package:flutter/material.dart';
import 'package:gema_app/pages/adBySearch.dart';
import '../main.dart';

class CustomSearchDelegate extends SearchDelegate{
  final String nim;
  CustomSearchDelegate({required this.nim}) : super();

  List<String> searchTerms = [
    "Makanan",
    "Minuman",
    "Pakaian"
  ];

  void querySearch(BuildContext context, query) {
    // print(nim);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>  AdBySearch(
                searchKey: query,
                nim: nim,
              )),
    );
  }


  @override
List<Widget> buildActions(BuildContext context) {
  return [
    IconButton(
      icon: const Icon(Icons.clear),
      onPressed: () {
        query = '';
      },
    ),
    IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {
        querySearch(context, query); 
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
