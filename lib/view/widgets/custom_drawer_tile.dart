import 'package:flutter/material.dart';

Widget customListTile(context,double width,String title, String iconString){
  return    Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
      leading: Image.asset(iconString,width: width*.07,),
      title: Text(title,style: TextStyle(fontSize: width*.05),),
       onTap: (){
         showDialog(
           context: context,
           builder: (BuildContext context) {
             return AlertDialog(
               title: Text(title,style: TextStyle(fontSize: width*.055),),
               content: Text('This is the $title section.'),
               actions: <Widget>[
                 TextButton(
                   child: Text('Close'),
                   onPressed: () {
                     Navigator.of(context).pop();
                   },
                 ),
               ],
             );
           },
         );
       },
));}