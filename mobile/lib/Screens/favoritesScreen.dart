import 'package:flutter/material.dart';
import 'package:bootcamp/Widgets/navbar.dart';

class favoritesPage extends StatefulWidget {
  const favoritesPage({super.key});

  @override
  State<favoritesPage> createState() => _favoritesPageState();
}

class _favoritesPageState extends State<favoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomNavigationBar(selectedIndex: 3),
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
        ],
      ),
    );
  }
}
