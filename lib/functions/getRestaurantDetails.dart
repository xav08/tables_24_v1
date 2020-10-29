import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

getRestaurantDetails1(String resName) async{
  print(resName);
  String theUrl = "https://tables24.000webhostapp.com/Savio/getRestaurantDetails1.php";
  var res = await http.post(Uri.encodeFull(theUrl),headers: {"Accept":"application/json"},
      body: {
        "resName": resName
      }
  );

  print(resName);
  var respBody = json.decode(res.body);
  print(respBody);
  return respBody;
}

getRestaurantDetails(String resId) async{
  print(resId);
  String theUrl = "https://tables24.000webhostapp.com/Savio/getRestaurantDetails.php";
  var res = await http.post(Uri.encodeFull(theUrl),headers: {"Accept":"application/json"},
      body: {
        "resId": resId
      }
  );
  var respBody = json.decode(res.body);
  print(respBody);
  return respBody;
}


getRestaurants()async{
  String theUrl = 'https://tables24.000webhostapp.com/Savio/getRestaurants.php';
  var res = await http.get(Uri.encodeFull(theUrl),headers: {"Accept":"application/json"});
  var responsBody = json.decode(res.body);
  print(responsBody);
  return responsBody;

}


getIcon(String str1){
  if(str1 == 'parking'){ return Icons.local_parking;}
  else if(str1 == 'fastfood'){ return Icons.fastfood;}
  else if(str1 == 'multicuisine'){return Icons.local_dining;}
  else if(str1 == 'cafe'){return Icons.local_cafe;}
  else return Icons.donut_large;
}


getTables(Map<String, String> requirements) async{
  String theUrl = 'https://tables24.000webhostapp.com/Savio/getTables.php';
  print("inside getTables" + requirements['date']);
  print("inside getTAbles" + requirements['time']);
  print("inside getTables" + requirements['noOfSeats']);
  print(requirements['date'] + ' ' + requirements['time']);
  var res = await http.post(Uri.encodeFull(theUrl),headers: {"Accept":"application/json"},
      body: {
        "dateTime": requirements['date'] + ' ' + requirements['time'],
        "noOfSeats": '2',
        "duration": '1',
      }
  );
  var responsBody = json.decode(res.body);
  print(responsBody);
  return responsBody;

}
