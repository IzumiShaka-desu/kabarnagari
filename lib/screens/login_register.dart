import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:kabarnagari/constants.dart';
import 'package:kabarnagari/provider/auth_provider.dart';
import 'package:kabarnagari/service/network_service.dart';
import 'package:provider/provider.dart';

import '../util.dart';

class LoginRegister extends StatefulWidget {
  @override
  _LoginRegisterState createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  Map<String, TextEditingController> loginController = {
    'email': TextEditingController(),
    'password': TextEditingController()
  };
  Map<String, TextEditingController> registerController = {
    'email': TextEditingController(),
    'password': TextEditingController()
  };
  GlobalKey<ScaffoldState> _sk = GlobalKey<ScaffoldState>();
  bool isLoading = false;
  bool isLoginPage = false;
  bool isLoginSucces = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _sk,
      appBar: AppBar(title: Text('kabarnagari')),
      body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(children: [
            AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                curve: Curves.fastLinearToSlowEaseIn,
                top: (isLoginPage) ? size.height * 2 : 0,
                child: Container(
                  height: size.height,
                  width: size.width,
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Title(
                            child: Text(
                              'Daftar',
                              style: TextStyle(fontSize: 24),
                            ),
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: createTextField(registerController['email'],
                              'email', Icon(Icons.email)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: createTextField(registerController['password'],
                              'password', Icon(Icons.lock_outline),
                              isObscure: true),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            (isLoading)
                                ? Center(child: RefreshProgressIndicator())
                                : Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: MaterialButton(
                                        onPressed: () => executeRegister(),
                                        child: Text(
                                          'daftar',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Anda sudah memiliki akun?, '),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isLoginPage = true;
                                });
                              },
                              child: Text('Login',
                                  style: TextStyle(color: Colors.blue)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )),
            AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                curve: Curves.fastLinearToSlowEaseIn,
                top: (!isLoginPage) ? size.height * 2 : 0,
                child: Container(
                  height: size.height,
                  width: size.width,
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Title(
                          child: Text(
                            'Masuk',
                            style: TextStyle(fontSize: 24),
                          ),
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: createTextField(loginController['email'],
                            'email', Icon(Icons.email)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: createTextField(loginController['password'],
                            'password', Icon(Icons.lock_outline),
                            isObscure: true),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          (isLoginSucces)
                              ? Container(
                                  padding: EdgeInsets.all(4),
                                  child: Icon(Icons.check, color: bgWhite),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle),
                                )
                              : (isLoading)
                                  ? Center(child: RefreshProgressIndicator())
                                  : Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: MaterialButton(
                                          onPressed: () => executeLogin(),
                                          child: Text(
                                            'masuk',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Anda belum memiliki akun?, '),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isLoginPage = false;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Daftar',
                                  style: TextStyle(color: Colors.blue)),
                            ),
                          )
                        ],
                      )
                    ]),
                  ),
                )),
          ])),
    );
  }

  executeLogin() async {
    FocusManager.instance.primaryFocus.unfocus();
    setState(() {
      isLoading = true;
    });
    if (checkNullTextController(loginController)) {
      _sk.currentState.removeCurrentSnackBar();
      _sk.currentState.showSnackBar(createSnackbar('field Tidak boleh kosong'));
    } else if (!EmailValidator.validate(loginController['email'].text)) {
      _sk.currentState.removeCurrentSnackBar();
      _sk.currentState.showSnackBar(createSnackbar('email tidak valid'));
    } else {
      String email = loginController['email'].text;
      String password = loginController['password'].text;
      bool result = false;
      try {
        result = await Provider.of<AuthProvider>(context, listen: false)
            .login(email, password);
           
          isLoginSucces = result;
        setState(() {
          isLoading = false;
          _sk.currentState.showSnackBar(createSnackbar((result)?'login berhasil':'login gagal'));
        });
      } catch (e) {
        debugPrint(e.toString());
        setState(() {
          isLoading = false;

          _sk.currentState.showSnackBar(createSnackbar('login gagal'));
        });
      }
    }
  }

  executeRegister() async {
    FocusManager.instance.primaryFocus.unfocus();
    setState(() {
      isLoading = true;
    });
    if (checkNullTextController(registerController)) {
      _sk.currentState.removeCurrentSnackBar();
      _sk.currentState.showSnackBar(createSnackbar('field Tidak boleh kosong'));
    } else if (!EmailValidator.validate(registerController['email'].text)) {
      _sk.currentState.removeCurrentSnackBar();
      _sk.currentState.showSnackBar(createSnackbar('email tidak valid'));
    } else if (registerController['password'].text.length < 6) {
      _sk.currentState.removeCurrentSnackBar();
      _sk.currentState.showSnackBar(
          createSnackbar('password tidak boleh kurang dari 6 digit'));
    } else {
      Map<String, dynamic> result = {
        'result': false,
        'message': 'register gagal'
      };

      String email = registerController['email'].text;
      String password = registerController['password'].text;
      NetworkService _networkService = NetworkService();
      try {
        result = await _networkService.register(email, password);
      } catch (e) {
        debugPrint(e.toString());
      }
      _sk.currentState.showSnackBar(createSnackbar(result['message']));
      if (result['result']) {
        setState(() {
          isLoginPage = true;
        });
      }
    }
    setState(() {
      isLoading = false;
    });
  }
}
