import 'package:flutter/material.dart';
import 'package:bootcamp/Widgets/navbar.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomNavigationBar(selectedIndex: 1),
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
                Text('Kategoriler', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 35.0, color: Colors.black87)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120), // Kategoriler için yukarıdan uzaklık (logonun altına yerleşmesi için)
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                _buildCategoryCard(context, 'Elektronik'),
                _buildCategoryCard(context, 'Ev ve Yaşam'),
                _buildCategoryCard(context, 'Hobi ve Eğlence'),
                _buildCategoryCard(context, 'Giysi ve Aksesuarlar'),
                _buildCategoryCard(context, 'Çocuk ve Bebek'),
                _buildCategoryCard(context, 'Bahçe ve Dış Mekan'),
                _buildCategoryCard(context, 'Araçlar ve Gereçler'),
                _buildCategoryCard(context, 'Evcil Hayvan'),
                _buildCategoryCard(context, 'Ofis ve Kırtasiye'),
                _buildCategoryCard(context, 'Kişisel Bakım ve Kozmetik'),
                _buildCategoryCard(context, 'Spor'),
                _buildCategoryCard(context, 'Müzik'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String categoryName) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey.shade400, width: 1),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(
          categoryName,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryDetailPage(categoryName: categoryName),
            ),
          );
        },
      ),
    );
  }
}

class CategoryDetailPage extends StatelessWidget {
  final String categoryName;

  const CategoryDetailPage({required this.categoryName, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Center(
        child: Text('Details for $categoryName'),
      ),
    );
  }
}
