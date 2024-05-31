import 'package:flutter/material.dart';
import 'package:firsttry/database_helper.dart';

class AddCertificate extends StatefulWidget {
  @override
  _AddCertificateState createState() => _AddCertificateState();
}

class _AddCertificateState extends State<AddCertificate> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sertifika Ekle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Sertifika Başlığı'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Sertifika Açıklaması'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    DatabaseHelper.instance.insertCertificate({
                      'title': _title,
                      'description': _description,
                    }).then((_) {
                      Navigator.pop(context);
                    });
                  }
                },
                child: Text('Add Certificate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
