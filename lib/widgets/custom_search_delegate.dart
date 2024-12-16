// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(
          Icons.clear,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);

    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> list = [];

    if (query.isNotEmpty) {
      list = [
        "Android",
        "iOS",
        "Jogos",
        "Navegação android",
      ]
          .where(
            (element) => element.toLowerCase().startsWith(query.toLowerCase()),
          )
          .toList();

      return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, int index) {
          return ListTile(
            title: Text(list[index]),
            onTap: () {
              close(context, list[index]);
            },
          );
        },
      );
    } else {
      return const Center(
        child: Text("No results"),
      );
    }
  }
}
