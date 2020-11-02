import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class Lingkaran extends StatefulWidget {
  @override
  _Lingkaran createState() => _Lingkaran();
}

class _Lingkaran extends State<Lingkaran> {
  double keliling ;
  double luas ;

  TextEditingController jari2 = TextEditingController();

  hitung(){
    if (jari2.text.isEmpty) {
      Toast.show('Isi dulu nilainya', context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM, textColor: Colors.black, backgroundColor: Colors.white);
    }if (jari2.text.isNotEmpty) {
      int r = int.parse(jari2.text);

      keliling = 2 * 3.14 * r ;
      luas = 3.14 * r * r ;

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
                "assets/images/lingkaran.png",
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: jari2,
                decoration: InputDecoration(
                  labelText: 'Nilai Jari-jari (r)'
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