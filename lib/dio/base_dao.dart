import 'package:redux/redux.dart';
import 'package:smart_park/http/http_client.dart';
import 'package:smart_park/redux/app_state.dart';

abstract class BaseDao {
  BaseDao(this.store);

  final Store<AppState> store;

  final HttpClient client = HttpClient();
}
