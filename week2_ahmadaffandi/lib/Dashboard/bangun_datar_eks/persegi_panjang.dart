import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class Persegipjg extends StatefulWidget {
  @override
  _Persegipjg createState() => _Persegipjg();
}

class _Persegipjg extends State<Persegipjg> {
  int keliling ;
  int luas ;

  TextEditingController panjang = TextEditingController();
  TextEditingController lebar = TextEditingController();

  hitung(){
     if (panjang.text.isEmpty && lebar.text.isEmpty) {
      Toast.show('Isi dulu nilainya', context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM, textColor: Colors.black, backgroundColor: Colors.white);
    }if (panjang.text.isNotEmpty && lebar.text.isNotEmpty) {
      int p = int.parse(panjang.text);
      int l = int.parse(lebar.text);

      keliling = (2 * p) + (2 * l) + 2*(p + l) ;
      luas = p * l ;

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
        title: Text('Hitung Persegi Panjang'),
      ),
      backgroundColor: Colors.lightBlueAccent,
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.only(top: 150, left: 15, right: 15),
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset(
                "assets/images/persegi-panjang.png",
                height: 150,
                width: 250,
                fit: BoxFit.cover,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: panjang,
                decoration: InputDecoration(
                  labelText: 'Nilai Panjang (p)'
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: lebar,
                decoration: InputDecoration(
                  labelText: 'Nilai Lebar (l)'
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