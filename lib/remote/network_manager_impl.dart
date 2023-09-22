
import 'package:doctor_appointment/remote/api_wrapper.dart';
import 'package:doctor_appointment/remote/remote.dart';

class NetworkManagerImplementation extends NetworkManager {
  @override
  ApiHandler apiHandler() {
    final apiHandler = ApiHandlerImplementation(
      apiWrapper: ApiWrapper(
      ),
    );
    return apiHandler;
  }
}
