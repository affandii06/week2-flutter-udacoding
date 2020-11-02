import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class Persegi extends StatefulWidget {
  @override
  _Persegi createState() => _Persegi();
}

class _Persegi extends State<Persegi> {
  int keliling ;
  int luas ;

  TextEditingController sisi = TextEditingController();

  hitung(){
    if (sisi.text.isEmpty) {
      Toast.show('Isi dulu nilainya', context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM, textColor: Colors.black, backgroundColor: Colors.white);
    }if (sisi.text.isNotEmpty) {
      int s = int.parse(sisi.text);

      keliling = 4 * s ;
      luas = s * s ;

      showDialog(
      context: context,builder: (_) => AssetGiffyDialog(
        image : Image.asset('assets/images/pinter.png'),
        title: Text('Anda mendapatkan hasilnya',
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 18.0, fontWeight: FontWeight.w600),
        ),
        description: Text('Keliling = ${keliling.toString()}, Luas = ${luas.toString()}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
        onOkButtonPressed: () {
          Navigator.pop(context);
        },
      ) );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hitung Persegi'),
      ),
      backgroundColor: Colors.lightBlueAccent,
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.only(top: 150, left: 15, right: 15),
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset(
                "assets/images/persegi.jpeg",
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: sisi,
                decoration: InputDecoration(
                  labelText: 'Nilai Sisi (s)'
                ),
              ),
              RaisedButton(
                child: Text('Hitung'),
                onPressed: (){
                  hitung();
                }
                )
            ],
          )
        )
      ),
    );
  }
}