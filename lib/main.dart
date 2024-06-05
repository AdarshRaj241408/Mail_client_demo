// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, use_build_context_synchronously, unused_import

import 'package:enough_mail/enough_mail.dart';
import 'package:flutter/material.dart';
import 'functions/auth_login.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _usernameError;
  String? _passwordError;
  String? _loginError;
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _setErrorMessages({
    //This set error message function is used while authentication when the textfields entered are incoorrect and login was not successfull
    String? usernameError,
    String? passwordError,
    String? loginError,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _usernameError = usernameError;
        _passwordError = passwordError;
        _loginError = loginError;
      });
    });
  }

  void _validateAndLogin() {
    //this function is called from auth_login.dart to take in input and check whether you can login
    validateAndLogin(
      context: context,
      formKey: _formKey,
      usernameController: _usernameController,
      passwordController: _passwordController,
      setErrorMessages: _setErrorMessages,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          //cloumn wise kept
          children: <Widget>[
            //one of the children is an array of widgets
            SizedBox(
              height: 30,
            ),
            Container(
              //box for image
              height: 380,
              decoration: BoxDecoration(
                //decorating the box
                image: DecorationImage(
                  //with an image
                  image: AssetImage(
                      'assets/images/final_back.png'), //importing image
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 10,
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Color.fromRGBO(57, 60, 104, 1),
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, 0.3),
                                blurRadius: 20.0,
                                offset: Offset(0, 1))
                          ]),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                // border: Border(
                                //     bottom: BorderSide(color: Colors.grey))
                                ),
                            child: TextFormField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Username",
                                hintStyle: TextStyle(
                                    color: Colors.grey[400], fontSize: 20),
                                errorText: _usernameError,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, 0.3),
                                blurRadius: 20.0,
                                offset: Offset(0, 1))
                          ]),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5.0),
                            child: TextFormField(
                              controller: _passwordController,
                              // obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    color: Colors.grey[400], fontSize: 20),
                                errorText: _passwordError,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    // Set opacity based on flag
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: _validateAndLogin,
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(143, 148, 251, 1),
                            minimumSize: Size(220, 50),
                            padding: EdgeInsets.symmetric(
                              horizontal: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (_loginError != null) ...[
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        _loginError!,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                        ),
                      ),
                    ],
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Forget Password?",
                      style: TextStyle(
                        color: Color.fromRGBO(143, 148, 251, 1),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )));
  }
}
