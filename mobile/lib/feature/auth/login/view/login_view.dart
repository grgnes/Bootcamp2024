import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _signScreenState();
}

class _signScreenState extends State<LoginView> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _isObscure = true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 90),
                Text(
                    'Giriş Yap',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 35.0, color: Colors.black87),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    labelText: 'E-Posta',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                      prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(
                        width: 2.0, // Kenar kalınlığı
                        color: Colors.black, // Kenar rengi
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(
                        width: 2.0, // Aktifken kenar kalınlığı
                        color: Colors.black, // Aktifken kenar rengi
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _password,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    labelText: 'Şifre',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    prefixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(
                        width: 2.0, // Kenar kalınlığı
                        color: Colors.black, // Kenar rengi
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(
                        width: 2.0, // Aktifken kenar kalınlığı
                        color: Colors.black, // Aktifken kenar rengi
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                      onPressed: () {},
                      child: Text('Şifremi Unuttum.', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
                  ),
                ),
        
                TextButton(
                  onPressed: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      'Giriş Yap',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                Divider(height: 70, indent: 20, endIndent: 25),
                TextButton(
                  onPressed: () {},
                  child: Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.0),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 12.0),
                        Image(
                            image: AssetImage('assets/google_logo.png'),
                          height: 24,
                        ),
                        SizedBox(width: 73),
                        Text(
                          'Google ile Giriş Yap',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
        
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Hesabın Yok Mu?',
                      style: TextStyle(
                          fontSize: 15,
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text('Kayıt Ol.', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15))
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
