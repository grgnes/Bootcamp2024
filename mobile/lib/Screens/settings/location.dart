import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  @override
  _AccountSettingsState createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<Location> {
  final _ulke = TextEditingController();
  final _sehir = TextEditingController();
  final _adres = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(17),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Ülke'),
            TextField(
              controller: _ulke,
              decoration: InputDecoration(
                labelText: 'Türkiye',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    width: 2.0,
                    color: Colors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    width: 2.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Text('Şehir'),
            TextField(
              controller: _sehir,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    width: 2.0,
                    color: Colors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    width: 2.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Text('Tam Adres Bilgisi'),
            TextField(
              controller: _adres,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    width: 2.0,
                    color: Colors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    width: 2.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton(
                onPressed: () {},
                child: Text('Değişiklikleri Kaydet',
                  style: TextStyle(color: Colors.black),)
            ),
          ],
        ),
      ),
    );
  }
}