import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tables_24_v1/functions/getRestaurantDetails.dart';
import 'package:tables_24_v1/widgets/starRating.dart';

class AllReservationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Reservations")),
      body: Column(
        children: <Widget>[
          Expanded(child: ShowReservationsCard()),
        ],
      ),
    );
  }
}

class ShowReservationsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    int rating;
    return FutureBuilder(
        future: getReservations('100001'),
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
                return Column(
                  children: <Widget>[
                    SizedBox(height: 20),

                    Container(
                      padding: EdgeInsets.all(10),
                      height: screenHeight / 2.5,
                      width: screenWidth - 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                        /*gradient: LinearGradient(
                    colors: [Colors.grey, Colors.white],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),*/
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            height: screenHeight / 10,
                            width: screenWidth,
                            child: Row(
                              children: <Widget>[
                                Image(
                                    image: NetworkImage(
                                  "${snap[index]['image']}",
                                )),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "${snap[index]['resName']}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      "${snap[index]['address']}",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(
                            height: 10,
                            thickness: 1,
                            indent: 10,
                            endIndent: 10,
                            color: Colors.grey,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            height: screenHeight / 8 + 42,
                            width: screenWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "BOOKING ID",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Text(
                                  "${snap[index]['resrId']}",
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "ORDERED ON",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            "${snap[index]['bookedDateTime']}",
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "NO OF PEOPLE",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            "6",
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "ORDERED ON",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            "${snap[index]['bookedDateTime']}",
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "STATUS",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            "${snap[index]['status']}",
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ]),
                              ],
                            ),
                          ),
                          Divider(
                            height: 5,
                            thickness: 1,
                            indent: 10,
                            endIndent: 10,
                            color: Colors.grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                            ("${snap[index]['status']}" != 'dining' && int.parse("${snap[index]['ratingCustomer']}") > 0) ?
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text((() {
                                    if("${snap[index]['status']}" == 'dined'){
                                      return "Your Rating";}
                                    else{
                                      return "Rating";}
                                  })(),

                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  StarRatingBuilder(int.parse('${snap[index]['ratingCustomer']}')),
                                ],
                              ): Container(),
                              ('${snap[index]['status']}' != 'cancelled' )
                                  ? InkWell(
                                      onTap: () {},
                                      child: Container(

                                        height:  30,
                                        width: 80,
                                        alignment: Alignment(0, 0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            border: Border.all(
                                                color: Colors.black)),
                                        child: Text("Cancel"),
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              });
        });
  }
}


