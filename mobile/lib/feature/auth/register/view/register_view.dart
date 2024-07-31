import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _loginScreenState();
}

class _loginScreenState extends State<RegisterView> {
  final _adSoyad = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _password2 = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 90),
              Text(
                'Kayıt Ol',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 35.0, color: Colors.black87),
              ),
              SizedBox(height: 30),
              TextField(
                controller: _adSoyad,
                decoration: InputDecoration(
                  labelText: 'Ad Soyad',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  prefixIcon: Icon(Icons.account_circle_rounded),
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
              SizedBox(height: 20),
              TextField(
                controller: _password2,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  labelText: 'Şifre Onayla',
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
              SizedBox(height: 20),
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
                    'Kayıt Ol',
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
                        'Google ile Kayıt Ol',
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
                    'Hesabın Var Mı?',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text('Giriş Yap.', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15))
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );


  }
}
