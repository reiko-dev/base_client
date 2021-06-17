import 'package:base_client/base_client.dart';
import 'package:base_client/controller/base_controller.dart';

class TestController with BaseController {
  void getData() async {
    var response = await BaseClient()
        .get('https://jsonplaceholder.typicode.com/', 'todos/1')
        .catchError(handleError);

    if (response != null) print(response);
  }

  void postData() async {
    var body = {'message': 'CodeX sucks!!!'};

    var response = await BaseClient()
        .post(
          'https://jsonplaceholder.typicode.com',
          '/posts',
          body,
        )
        .catchError(handleError);

    if (response != null) print(response);
  }
}
