import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tables_24_v1/functions/getRestaurantDetails.dart';
import 'package:tables_24_v1/screens/mainScreen.dart';


class ShowTables extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getRestaurants(),
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

        return ListView.builder(
          itemCount: snap.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                String temp = snap[index]['res_name'];
                String temp1 = snap[index]['restaurant_id'];
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                );
              },
              child: Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72),
                  title: Text(
                      "restaurant_id: ${snap[index]['restaurant_id']}"),
                  subtitle: Text("res_name ${snap[index]['res_name']}\n "),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
