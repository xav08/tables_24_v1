import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tables_24_v1/functions/getRestaurantDetails.dart';
import 'package:tables_24_v1/screens/mainScreen.dart';


class ShowTables extends StatelessWidget {
  Map<String, String> requirements;
  ShowTables(Map<String, String> this.requirements);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTables(requirements),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        List snap = snapshot.data;

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("Error fetching Data"),
          );
        }
        print(requirements['date']);
        print(requirements['time']);
        print(requirements['noOfSeats']);

        return ListView.builder(
          itemCount: snap.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72),
                  title: Text(
                      "table_id: ${snap[index]['tableId']}"),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
