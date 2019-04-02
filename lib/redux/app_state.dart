import 'package:smart_park/components/personal/data/my_info_response.dart';
import 'package:smart_park/data/user_data.dart';
import 'package:smart_park/redux/account_reducer.dart';
import 'package:smart_park/redux/my_info_reducer.dart';

class AppState {
  AppState({this.account, this.info});

  Account account;

  MyInfoData info;
}

AppState appReducer(AppState state, action) => AppState(
    account: accountReducer(state.account, action),
    info: myInfoReducer(state.info, action));
