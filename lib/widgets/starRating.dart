import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  int rating;

  StarRating(int this.rating);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.star,
          color: Colors.yellowAccent,
          size: 20.0,
        ),
        Icon(
          Icons.star,
          color: Colors.yellowAccent,
          size: 20.0,
        ),
        Icon(
          Icons.star,
          color: Colors.yellowAccent,
          size: 20.0,
        ),
        Icon(
          Icons.star,
          color: Colors.yellowAccent,
          size: 20.0,
        ),
        rating > 4
            ? Icon(
                Icons.star,
                color: Colors.yellowAccent,
                size: 20.0,
              )
            : Icon(
                Icons.star,
                color: Colors.grey,
                size: 20.0,
              ),
        SizedBox(width: 5.0),
        Text(
          "(22 Reviews)",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class StarRatingBuilder extends StatelessWidget {
  int rating;
  StarRatingBuilder(int this.rating);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 24.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
                child: rating > index
                ? Icon(
                    Icons.star,
                    color: Colors.yellowAccent,
                    size: 20.0,
                  )
                : Icon(
                    Icons.star,
                    color: Colors.grey,
                    size: 20.0,
                  )
            );

          }),
    );
  }
}
