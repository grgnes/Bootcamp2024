import 'package:bootcamp/Screens/settings/accountsettings.dart';
import 'package:bootcamp/Screens/settings/location.dart';
//import 'package:bootcamp/Screens/settings/teklifler.dart';
import 'package:flutter/material.dart';
import 'package:bootcamp/Widgets/navbar.dart';



class settingPage extends StatefulWidget {
  const settingPage({super.key});

  @override
  State<settingPage> createState() => _settingPageState();
}

class _settingPageState extends State<settingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomNavigationBar(selectedIndex: 0),
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
                  'assets/aramızda_logo.jpg',
                  height: 80,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 72),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Ayarlar', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 35.0, color: Colors.black87)),
              ],
            ),
          ),
          Divider(height: 280, indent: 25, endIndent: 25),
          ListView(
            padding: EdgeInsets.symmetric(vertical: 150,horizontal: 20),
            children: [
              _buildListTile(context, 'Profili Düzenle', AccountSettings()),
              _buildListTile(context, 'Premium Ayarları', PremiumSetting()),
              _buildListTile(context, 'Adres', Location()),
              _buildListTile(context, 'Gizlilik ve Güvenlik', PriviatySecurity()),
              //_buildListTile(context, 'Teklifler', teklifler()),
              _buildListTile(context, 'Çıkış', signOut()),
            ],
          ),
        ],
      ),

    );
  }
  Widget _buildListTile(BuildContext context, String title, Widget targetPage) {
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      trailing: Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetPage),
        );
      },
    );
  }
}

class PremiumSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Text('Henüz ayarlanmadı'),
      ),
    );
  }
}
class PriviatySecurity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          'assets/gizlilik.png',
          fit: BoxFit.cover, // Ensures the image covers the entire area
        ),
      ),
    );
  }
}
class signOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Text('Language Settings Page'),
      ),
    );
  }
}

