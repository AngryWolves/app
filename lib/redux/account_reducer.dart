import 'package:redux/redux.dart';
import 'package:smart_park/data/user_data.dart';

class UpdateAccountAction {
  UpdateAccountAction(this.account);

  final Account account;
}

Account _updateAccount(Account account, UpdateAccountAction action) =>
    action.account;

final accountReducer = combineReducers<Account>(
    [TypedReducer<Account, UpdateAccountAction>(_updateAccount)]);
