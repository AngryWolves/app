import 'package:redux/redux.dart';
import 'package:smart_park/components/personal/data/my_info_response.dart';

class UpdateMyInfoAction {
    UpdateMyInfoAction(this.info);

    final MyInfoData info;
}

MyInfoData _updateMyInfo(MyInfoData account, UpdateMyInfoAction action) =>
        action.info;

final myInfoReducer = combineReducers<MyInfoData>(
        [TypedReducer<MyInfoData, UpdateMyInfoAction>(_updateMyInfo)]);