import 'package:flutter/material.dart';

class SkillCard extends StatelessWidget {
  final int id;
  final String title;
  final String description;
  final Function onDelete;

  SkillCard({
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
                  title: Text('Delete Skill'),
                  content: Text('Are you sure you want to delete this skill?'),
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
