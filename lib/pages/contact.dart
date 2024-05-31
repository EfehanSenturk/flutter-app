// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  ContactPage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('İletişim'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ad Soyad',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                prefixIconColor: Colors.red[800],
                hintText: 'Adınız ve soyadınızı girin',
              ),
            ),
            SizedBox(height: 10),
            Text(
              'E-posta',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                  hintText: 'E-posta adresinizi girin',
                  prefixIconColor: Colors.blue[800]),
            ),
            SizedBox(height: 10),
            Text(
              'Mesaj',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Mesajınızı buraya yazın',
              ),
              maxLines: 5,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Form gönderme işlemi burada yapılabilir
              },
              child: Text('Gönder'),
            ),
          ],
        ),
      ),
    );
  }
}
