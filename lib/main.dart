import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false ,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Transferências atuais"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {  },
          child: Icon(Icons.add),
        ),
      ),
    ));

