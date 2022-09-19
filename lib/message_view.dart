import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('notification'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(onPressed: () async{
          var data = await FirebaseFirestore.instance.collection('users').doc('2').get();
          print(data['token']);

          sendNotification(data['token']);
        }, child:const  Text('send')),
      ),
    );
  }

  void sendNotification(String token)  async{


    var url = Uri.parse('https://fcm.googleapis.com/fcm/send');

    var response = await http.post(url,headers: {
      'Content-Type' : 'application/json',
      'Authorization' : 'key=AAAA9WD14Dk:APA91bHdfidVKqWNz1Xc1YXuBmPN5Jg1DaBJmnqtYw_4iy-QTD3cxWk66XJcy7Mqlj59MTL4JCXbPzjUboHGS8Wbwi8E41u-YdMEGDzz5_9Nj6OVMHdNZ6v8-lv6pET9czaqZpYTsJ5m'
    }, body: jsonEncode({
      "priority" : "high",
      'to' : token,
      "notification" :
      {
        "body" : "my notification is sending",
        "title" : "this is the title",
        "android_channel_id" :  "Mychannel"

      }
    }));



    print(response.statusCode);
  }
}
