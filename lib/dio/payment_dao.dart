import 'package:redux/src/store.dart';
import 'package:smart_park/components/payment/data/my_payment_response.dart';
import 'package:smart_park/dio/base_dao.dart';
import 'package:smart_park/http/api.dart';
import 'package:smart_park/redux/app_state.dart';

class PaymentDao extends BaseDao {
  PaymentDao(Store<AppState> store) : super(store);

  ///
  /// 查询我的缴费
  ///
  Future<MyPaymentResponse> getPaymentList({int page}) async {
    var response = await client.post(Api.SMART_PAYMENT,
        headers: {Api.SMART_TOKEN: getToken()},
        data: {Api.SMART_PAGE: page, Api.SMART_SIZE: 10});

    var data = response?.data;
    if (data == null) {
      return null;
    }
    return MyPaymentResponse.fromJson(data);
  }
}
