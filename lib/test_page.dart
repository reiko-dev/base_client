import 'package:base_client/controller/test_controller.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  TestPage({Key? key}) : super(key: key);

  final controller = TestController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () async {
                controller.getData();
              },
              child: Text(
                'Get',
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                controller.postData();
              },
              child: Text(
                'Post',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
