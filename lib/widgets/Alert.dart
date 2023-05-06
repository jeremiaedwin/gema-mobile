import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  const Alert({
    Key? key,
    required this.message,
    required this.title,
    required this.status,
  }) : super(key: key);

  final String title;
  final String message;
  final String status;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    });

    return const SizedBox.shrink();
  }
}