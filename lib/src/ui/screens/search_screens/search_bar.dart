import 'package:flutter/material.dart';
import 'package:master_brother/src/repo/models/customer_model.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';
import 'package:master_brother/src/utils/methods/navigators.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<CustomerModel> customers;
  final ValueNotifier<CustomerModel?> selected;

  CustomSearchDelegate({
    required this.customers,
    required this.selected,
  });

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(
          Icons.clear,
          color: mainColor,
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: mainColor,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<CustomerModel> matchQuery = [];

    for (var item in customers) {
      if (item.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }

    return Container(
      color: const Color(0xff38404b),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              matchQuery[index].name,
              style: const TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              selected.value = matchQuery[index];
              pop(context);
            },
          );
        },
        itemCount: matchQuery.length,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<CustomerModel> matchQuery = [];

    for (var item in customers) {
      if (item.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }

    return Container(
      color: const Color(0xff38404b),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              matchQuery[index].name,
              style: const TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              selected.value = matchQuery[index];
              pop(context);
            },
          );
        },
        itemCount: matchQuery.length,
      ),
    );
  }
}
