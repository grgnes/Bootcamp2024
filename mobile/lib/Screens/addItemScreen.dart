import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Fotoğraf seçme kütüphanesi
import 'dart:io';

import '../Widgets/navbar.dart'; // File sınıfını kullanmak için

class addItemPage extends StatefulWidget {
  @override
  _AddProductPhotoState createState() => _AddProductPhotoState();
}

class _AddProductPhotoState extends State<addItemPage> {
  XFile? _image; // Nullable XFile olarak tanımladık
  final ImagePicker _picker = ImagePicker(); // Fotoğraf seçici
  final _nameController = TextEditingController();
  final _detailsController = TextEditingController();
  String? _selectedCategory;
  String _condition = 'Hiç kullanılmamış';
  String _warranty = 'Yok';
  final _exchangeOptionsController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomNavigationBar(selectedIndex: 2),
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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 90),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      height: 300,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: _image == null
                          ? Center(
                              child: Text('Fotoğraf Seçin',
                                  style: TextStyle(fontSize: 18)))
                          : Image.file(
                              File(_image!.path),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Ürün Adı',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _detailsController,
                    decoration: InputDecoration(
                      labelText: 'Ürün Açıklaması',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 4,
                  ),
                  SizedBox(height: 10),
                  DropdownButton<String>(
                    hint: Text('Kategori Seçin'),
                    value: _selectedCategory,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCategory = newValue;
                      });
                    },
                    items: <String>['Elektronik', 'Ev Eşyası', 'Giyim', 'Kitap']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10),
                  Text('Ürün Durumu'),
                  DropdownButton<String>(
                    value: _condition,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _condition = newValue;
                        });
                      }
                    },
                    items: <String>[
                      'Hiç kullanılmamış',
                      'Kullanılmış',
                      'Hasarlı',
                      'Az Hasarlı'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10),
                  Text('Garanti Bilgisi'),
                  DropdownButton<String>(
                    value: _warranty,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _warranty = newValue;
                        });
                      }
                    },
                    items: <String>['Var', 'Yok']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  // Takas seçenekleri
                  TextField(
                    controller: _exchangeOptionsController,
                    decoration: InputDecoration(labelText: 'Takas Seçenekleri'),
                    maxLines: 3,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Ürün bilgilerini kaydetmek ve göstermek için kod buraya gelecek
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Ürün Bilgileri Kaydedildi!'),
                        ),
                      );
                      _nameController.clear();
                      _detailsController.clear();
                      _exchangeOptionsController.clear();
                      setState(() {
                        _selectedCategory = null;
                        _condition = 'Hiç kullanılmamış';
                        _warranty = 'Yok';
                      });
                    },
                    child: Text('Ekle'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
