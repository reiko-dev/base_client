import 'package:base_client/helper/dialog_helper.dart';
import 'package:base_client/services/app_exception.dart';

class BaseController {
  void handleError(error) {
    if (error is FetchDataExpection) {
      var message = error.message;
      DialogHelper.showErrorDialog(description: message);
    } else if (error is BadRequestException) {
      var message = error.message;
      DialogHelper.showErrorDialog(description: message);
    } else if (error is ApiNotRespondingException) {
      DialogHelper.showErrorDialog(
          description: 'Oops! It took longer to responde.');
    }
  }
}
