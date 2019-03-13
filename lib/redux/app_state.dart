import 'package:smart_park/data/user_data.dart';
import 'package:smart_park/redux/account_reducer.dart';

class AppState {
  AppState({this.account});

  Account account;
}

AppState appReducer(AppState state, action) => AppState(
    account: accountReducer(state.account, action)
);