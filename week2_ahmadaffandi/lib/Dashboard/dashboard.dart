import 'package:flutter/material.dart';
import 'package:week2_ahmadaffandi/Dashboard/bangun_datar.dart';
import 'package:week2_ahmadaffandi/Dashboard/umur.dart';
import 'package:week2_ahmadaffandi/main.dart';

class Dashboard extends StatefulWidget {
  final String username;
  Dashboard(this.username);
  @override
  _Dashboard createState() => _Dashboard(this.username);
}

class _Dashboard extends State<Dashboard> {
  final String username;
  _Dashboard(this.username);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard User'),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10, right:10),
              color: Colors.lightBlueAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Welcome ${this.username}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: RaisedButton(
                      color: Colors.blueGrey,
                      child: Text('Log Out',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()));
                      },
                    )
                  )
                ]
              )
            ),
            Container(
              padding: EdgeInsets.only(top:200),
              child: Column(
                children: <Widget>[
                  Text('Piih Aksi:',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  RaisedButton(
                    color: Colors.blueGrey,
                    child: Text('Hitung Usia',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Umur()));
                    }
                  ),
                  RaisedButton(
                    color: Colors.blueGrey,
                    child: Text('Hitung Bangun Datar',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Bangtar()));
                    }
                  ),
                ]
              )
            )
          ]
        )
      ),
    );
  }
}