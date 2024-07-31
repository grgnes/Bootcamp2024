import 'package:flutter/material.dart';
import 'package:bootcamp/Screens/profileScreen.dart';
import '../Widgets/navbar.dart';
class productView extends StatefulWidget {
  const productView({super.key});

  @override
  State<productView> createState() => _productViewState();
}

class _productViewState extends State<productView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomNavigationBar(selectedIndex: 4),
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 17),
              child: Transform.translate(
                offset: Offset(0, -20),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/aramızda_logo.jpg',
                    height: 80,
                  ),
                ),
              ),
            ),
            Container(
              width: 300.0,
              height: 300.0,
              color: Colors.grey, // Geçici olarak gri bir kutu kullanabilirsiniz
            ),

            SizedBox(height: 30),
            Divider(height: 30,thickness: 2),
            Row(
              children: [
                SizedBox(width: 55,),
                Text('Ürün adı: ',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500)),
                Text('ürün adı'),
              ],
            ),
            SizedBox(height: 20,),
            Divider(height: 30,thickness: 2),
            Row(
              children: [
                SizedBox(width: 55,),
                Text('Ürün Açıklaması: ',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500)),
                Text('ürün adı'),
              ],
            ),
            SizedBox(height: 20,),
            Divider(height: 30,thickness: 2),
            Row(
              children: [
                SizedBox(width: 55,),
                Text('Ürün Durumu: ',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500)),
                Text('ürün adı'),
              ],
            ),
            SizedBox(height: 20,),
            Divider(height: 30,thickness: 2),
            Row(
              children: [
                SizedBox(width: 55,),
                Text('Garantisi: ',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500)),
                Text('ürün adı'),
              ],
            ),
            Divider(height: 30,thickness: 2),



          ],
        ),
      ),
    );
  }
}
