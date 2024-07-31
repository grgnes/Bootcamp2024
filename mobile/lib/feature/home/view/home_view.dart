import 'package:bootcamp/Screens/productView.dart';
import 'package:bootcamp/Screens/settingScreen.dart';
import 'package:flutter/material.dart';
import 'package:bootcamp/Widgets/navbar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _homePageScreenState();
}

class _homePageScreenState extends State<HomeView> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomNavigationBar(selectedIndex: 0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.chat_bubble),
                ),
                SizedBox(width: 117),
                Transform.translate(
                  offset: Offset(1, 42),
                  child: Image.asset(
                    'assets/aramızda_logo.jpg',
                    height: 80,
                  ),
                ),
                SizedBox(width: 110),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => settingPage()),
                    );
                  },
                  icon: Icon(Icons.settings),
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              child: Text(
                'Hoş Geldin,',
                style: TextStyle(fontSize: 23),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: Text('AD SOYAD',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Koltuk, masa, lamba vb.',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                      fillColor: Colors.grey[200],
                    ),
                    onChanged: (query) {
                      // Burada arama işlemi yapılabilir
                      print('Arama yapılıyor: $query');
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => PremiumSetting()),
                  );
                },
                child: Container(
                  width: 380.0,
                  height: 210.0,
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.blue[600],
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'PREMİUM \nFIRSATI !',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            TextButton(
                onPressed: () {},
                child: Text('Öne Çıkarılanlar',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.black))),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => productView()),
                  );
                },
                child: Container(
                  width: 380.0,
                  height: 110.0,
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.orangeAccent,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          /* image: DecorationImage(
                        image: AssetImage('assets/profile_placeholder.png'),
                        fit: BoxFit.cover,
                      ),*/
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ürünün adı',
                            style: TextStyle(fontSize: 30),
                          ),
                          SizedBox(height: 7),
                          Text(
                            'kategorisi',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
