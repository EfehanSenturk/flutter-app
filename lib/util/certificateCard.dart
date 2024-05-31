import 'package:flutter/material.dart';

class CerticateCard extends StatelessWidget {
  final int id;
  final String title;
  final String description;
  final Function onDelete;

  CerticateCard({
    required this.id,
    required this.title,
    required this.description,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Delete Certificate'),
                  content: Text('Are you sure you want to delete this certificate?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        onDelete();
                        Navigator.of(context).pop();
                      },
                      child: Text('Delete'),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
