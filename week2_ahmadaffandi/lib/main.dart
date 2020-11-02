import 'package:flutter/material.dart';
import 'Dashboard/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sijago Hitung',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _notif = GlobalKey<ScaffoldState>(); 

  bool _password = true;
  String user = 'admin';
  String pass = 'admin';
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController(); 
  
  showhide(){
    setState(() {
      _password = !_password;
    });
  }

  validasi(){
    if (username.text.toString() == user && password.text.toString() == pass) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard(username.text))
      );
    }if (username.text.isEmpty) {
      _notif.currentState.showSnackBar(SnackBar(content: Text('Username Tidak Boleh Kosong'),));
    }if (password.text.isEmpty) {
      _notif.currentState.showSnackBar(SnackBar(content: Text('Password Tidak Boleh Kosong'),));
    }if (password.text.length < 5) {
     _notif.currentState.showSnackBar(SnackBar(content: Text('Password Tidak Boleh Kurang dari 5'),)); 
    }else {
      _notif.currentState.showSnackBar(SnackBar(content: Text('Informasi yang Anda Masukkan Salah'),));
    }
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      key: _notif,
      backgroundColor: Colors.lightBlueAccent,
      resizeToAvoidBottomPadding: false,
      body: Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 100),
                  width: 300,
                  height:400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),

                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          "assets/images/logo.png",
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        
                        Text("Sijago Hitung",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                          child: TextFormField(
                            controller: username,
                            decoration: InputDecoration(
                              labelText: "Username",
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                              prefixIcon: Icon(
                                  Icons.people_alt,
                                  color: Colors.grey,
                                ),
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                          child: TextFormField(
                            controller: password,
                            obscureText: _password,
                            decoration: InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                              prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.grey
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _password ? Icons.visibility_off : Icons.visibility,
                                  color: _password ? Colors.grey : Colors.blue,
                                  ), 
                                onPressed: (){
                                  setState(() {
                                    showhide();
                                  });
                                }
                                
                                )
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: RaisedButton(
                            child: Text('Login'),
                            onPressed: (){
                              validasi();
                            }),
                        )
                      ]
                    )
                  ),
                )
              ]
            ),


      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
