import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tables_24_v1/functions/getRestaurantDetails.dart';
import 'package:tables_24_v1/widgets/restaurantBookingButton.dart';
import 'package:tables_24_v1/widgets/restaurantDescription.dart';
import 'package:tables_24_v1/widgets/restaurantFeatures.dart';
import 'package:tables_24_v1/widgets/restaurantFeaturesCard.dart';
import 'package:tables_24_v1/widgets/restaurantImage.dart';

class HomePage extends StatefulWidget {
  String resName;
  String resId;
  HomePage(String this.resName, String this.resId);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getRestaurantDetails(widget.resId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          List snap1 = snapshot.data;

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
          print(snap1);
          return Material(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: 5.0, right: 5.0, bottom: 5.0),
                  child: Column(
                    children: <Widget>[
                      RestaurantImage(snap1),
                      SizedBox(
                        height: 20.0,
                      ),
                     // RestaurantFeatures(snap1),
                      RestaurantFeaturesCard("${snap1[0]['features']}"),
                      SizedBox(height: 20.0),
                      RestaurantDescription(snap1),
                      RestaurantBookingButton(snap1),
                    ],
                  ),
                ),

              ],
            ),
          );
        }
        ,
      ),
    );
  }
}