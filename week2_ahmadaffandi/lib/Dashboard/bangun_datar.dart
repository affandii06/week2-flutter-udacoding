import 'package:flutter/material.dart';
import 'bangun_datar_eks/lingkaran.dart';
import 'bangun_datar_eks/persegi.dart';
import 'bangun_datar_eks/persegi_panjang.dart';

class Bangtar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hitung Bangun Datar'),
        ),
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        padding: EdgeInsets.only(top:200),
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Persegi'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Persegi()));
                }
              ),
              RaisedButton(
                child: Text('Persegi Panjang'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Persegipjg()));
                }
              ),
              RaisedButton(
                child: Text('Lingkaran'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Lingkaran()));
                }
              ),
            ],
          )
        ),
      ),
    );
  }
}