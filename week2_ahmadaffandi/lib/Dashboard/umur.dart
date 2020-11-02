import 'package:flutter/material.dart';
import 'package:age/age.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class Umur extends StatefulWidget {
  @override
  _UmurState createState() => _UmurState();
}

class _UmurState extends State<Umur> {
  AgeDuration age ;
  
  TextEditingController tanggal = TextEditingController();
  TextEditingController bulan = TextEditingController();
  TextEditingController tahun = TextEditingController();

  hitung(){
    DateTime ultah = DateTime(int.parse(tahun.text), int.parse(bulan.text), int.parse(tanggal.text));
    DateTime today = DateTime.now();

    age = Age.dateDifference(
      fromDate: ultah, 
      toDate: today,
      includeToDate: false
    );

    if (age.years.toInt() < 20) {
      showDialog(
      context: context,builder: (_) => AssetGiffyDialog(
        image : Image.asset('assets/images/anak.jpg'),
        title: Text('Usia anda saat ini ${age.toString()}',
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 18.0, fontWeight: FontWeight.w600),
        ),
        description: Text('Usiamu masih sangat belia, nikmatilah waktu bermain bersama keluarga maupun teman, karen diusia ini karaktermu sebagai manusia mulai terbentuk.',
              textAlign: TextAlign.center,
              style: TextStyle(),
            ),
        onOkButtonPressed: () {
          Navigator.pop(context);
        },
      ) );
    }if (age.years.toInt() > 19 && age.years < 50) {
     showDialog(
      context: context,builder: (_) => AssetGiffyDialog(
        image : Image.asset('assets/images/pemuda.jpg'),
        title: Text('Usia anda saat ini ${age.toString()}',
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 18.0, fontWeight: FontWeight.w600),
        ),
        description: Text('Usiamu saat ini tidakah kecil, kau telah memasuki fase paling penting dalam kehidupan, carilah pengalaman dan juga teman, karena itu akan jadi hal penting yang menentukan masa depanmu.',
              textAlign: TextAlign.center,
              style: TextStyle(),
            ),
        onOkButtonPressed: () {
          Navigator.pop(context);
        },
      ) ); 
    }if (age.years.toInt() >49) {
     showDialog(
      context: context,builder: (_) => AssetGiffyDialog(
        image : Image.asset('assets/images/tua.jpg'),
        title: Text('Usia anda saat ini ${age.toString()}',
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 18.0, fontWeight: FontWeight.w600),
        ),
        description: Text('Usiamu saat ini sudah mulai renta, jaga kesehatan dan juga keimanan, mulailah menikmati bagaimana generasi dibawahmu tumbuh dengan baik.',
              textAlign: TextAlign.center,
              style: TextStyle(),
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
        title: Text('Hitung Umur'),
      ),
      backgroundColor: Colors.lightBlueAccent,
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.only(top:200, left: 15, right: 15,),
        child: Column(
          children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.number,
                controller: tanggal,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  labelText: 'Tanggal Lahir',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                ),
              ),
              Container(
                padding: EdgeInsets.only(top:20),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: bulan,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    labelText: 'Bulan Lahir',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top:20),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: tahun,
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    labelText: 'Tahun Lahir',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                  ),
                ),
              ),
              RaisedButton(
                child: Text('Hitung'),
                onPressed: (){
                  hitung();
                })
          ],
          )
      ),
    );
  }
}
