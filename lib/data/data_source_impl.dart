import 'package:doctor_appointment/data/data.dart';
import 'package:doctor_appointment/remote/remote.dart';

class DataSourceImpl extends DataSource {

  @override
  NetworkManager getNetworkManager() => NetworkManagerImplementation();
}
