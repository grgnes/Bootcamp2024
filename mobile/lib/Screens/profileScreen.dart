import 'package:bootcamp/Screens/productView.dart';
import 'package:flutter/material.dart';
import 'package:bootcamp/Widgets/navbar.dart';
import 'package:bootcamp/Screens/settingScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;
  String _city = 'Yükleniyor...';

  @override
  void initState() {
    super.initState();
    _loadCity();
  }

  Future<void> _loadCity() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _city = prefs.getString('city') ?? 'Şehir bilgisi yok';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomNavigationBar(selectedIndex: 4),
      appBar: AppBar(
        toolbarHeight: 20,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 17),
            child: Transform.translate(
              offset: Offset(0, -20),
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/aramizda_logo.jpg',
                  height: 80,
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 16,
            right: 16,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: NetworkImage(
                      "https://media.licdn.com/dms/image/v2/D4D03AQGU0NPgazYOjQ/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1721922691955?e=1727913600&v=beta&t=LOANn8lN1MihgWRUPOPbyv9un4a_N8K-bN1bwW9D_2M"), // Placeholder image path
                ),
                SizedBox(height: 16),
                Text('Mehmet Ali Keklik', style: TextStyle(fontSize: 25)),
                SizedBox(height: 10),
                Text('$_city', style: TextStyle(fontSize: 20)),
                SizedBox(
                    height:
                        16), // Add space between the city and the toggle buttons
                ToggleButtons(
                  isSelected: [_selectedIndex == 0, _selectedIndex == 1],
                  onPressed: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('Ürünler', style: TextStyle(fontSize: 16)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('Yorumlar', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                  borderColor: Colors.black,
                  selectedColor: Colors.white,
                  fillColor: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                SizedBox(
                    height: 16), // Space between toggle buttons and the content
                IndexedStack(
                  index: _selectedIndex,
                  children: [
                    _buildProductsContent(), // Content for 'Ürünler'
                    _buildCommentsContent(), // Content for 'Yorumlar'
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            right: 16,
            child: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => settingPage()),
                );
              },
              icon: Icon(Icons.settings),
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductsContent() {
    return Center(
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
                child: Image.network(
                    "https://www.luksatolye.com/resimler/b/chester-koltuk-uc-kisilik-deri-kanepe-siyah-renk-hakiki-koltuk120627b2.jpg"),
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
                    'Deri Koltuk',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: 7),
                  Text(
                    'Koltuk',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCommentsContent() {
    return Center(
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
                child: Image.network(
                    "https://i0.shbdn.com/photos/79/40/55/x5_11707940553ag.jpg"),
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
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Yemek Masası',
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'Oldukça iyi bir takas oldu...',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
