import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showPass = false;
  bool _showUserError = false;

  bool _showPassError = false;
  TextEditingController _userController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(30, 0, 30, 40),
          constraints: BoxConstraints.expand(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
                child: FlutterLogo(),
              ),
              SizedBox(height: 20),
              Text(
                'Hello\n Welcome to Flutter',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 30),
              TextField(
                controller: _userController,
                decoration: InputDecoration(
                    labelText: 'User name',
                    errorText: _showUserError ? 'Not validate user name' : null,
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    )),
              ),
              SizedBox(height: 10),
              Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  TextField(
                    controller: _passController,
                    obscureText: _showPass,
                    decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        errorText: _showPassError ? 'Not valid password' : null,
                        labelStyle: TextStyle(
                          fontSize: 15,
                        )),
                  ),
                  GestureDetector(

                    onTap: onShowClicked,
                    child: Text(
                      'Show',
                      style: TextStyle(color: Colors.blue, fontSize: 14),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  onPressed: onLogin,
                  child: Text('Sign in', style: TextStyle(color: Colors.white),),
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 14,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('New User? SIGN UP', style: TextStyle(color: Colors.grey),),
                  Text('FORGOT PASSWORD?', style: TextStyle(fontSize: 15, color: Colors.blue),),
                ],
              )
            ],
          ),
        ));
  }

  void onLogin(){
      setState(() {
        if(_userController.text.length <6 || _userController.text.length > 20)
          _showUserError = true;
        else
          _showUserError = false;

        if(_passController.text.length < 6)
          _showPassError = true;
        else
          _showPassError = false;

        if(!_showPassError && !_showPassError){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
        }
      });

      Widget goHomme(BuildContext context){
        return Home();
      }
  }

  void onShowClicked(){
    setState(() {
      _showPass = !_showPass;
    });
  }
}
