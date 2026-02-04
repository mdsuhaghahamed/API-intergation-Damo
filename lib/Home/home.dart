import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> post = [];

  final url = Uri.parse(
    "https://www.youtube.com/watch?v=t9cm7XGns6I&list=PL-hhMBvVJVm5GMfisHyOWyatw93HC77IV&index=4",
  );

  Future fachData() async {
    final respons = await http.get(url);
    final jasonData = jsonDecode(respons.body);

    post = jasonData;

    if (respons.statusCode == 200) {
      print("sucsees");

      print(jasonData);
    } else {
      print("fiels");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fachData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Api intigation ")),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return Card(child: ListTile(title: Text(post[index]["title"])));
        },
      ),
    );
  }
}
