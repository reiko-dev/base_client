import 'package:base_client/base_client.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              var response = await BaseClient()
                  .get('https://jsonplaceholder.typicode.com/', 'todos/1');
              print(response);
            },
            child: Text('Run'),
          ),
        ),
      ),
    );
  }
}
