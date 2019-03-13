import 'package:dio/dio.dart';
import 'package:smart_park/http/api.dart';

const METHOD_GET = 'GET';
const METHOD_POST = 'POST';
const METHOD_PUT = 'PUT';
const METHOD_DELETE = 'DELETE';

class HttpClient {
  static const int CONNECTION_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 10000;
  static const String _ENCODING = 'Accept-Encoding';
  static const String _Accept = 'Accept';
  static const String _HEADER_ACCEPT_TYPE = '*/*';

  factory HttpClient() {
    if (_instance == null) {
      _instance = HttpClient._internal();
    }
    return _instance;
  }

  HttpClient._internal() {
    _dio = Dio();
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: _onRequestInterceptor,
        onResponse: _onSuccessInterceptor,
        onError: _onErrorInterceptor));
//    _setProxy();
  }

  static HttpClient _instance;

  Dio _dio;

  /// send a post request
  Future<Response> delete(String path,
      {dynamic data,
      Map<String, dynamic> headers,
      CancelToken cancelToken}) async {
    return _sendRequest(
        path,
        await _mergeOptions(RequestOptions(
            data: data, headers: headers, method: METHOD_DELETE)));
  }

  /// send a post request
  Future<Response> put(String path,
      {dynamic data,
      Map<String, dynamic> headers,
      CancelToken cancelToken}) async {
    return _sendRequest(
        path,
        await _mergeOptions(
            RequestOptions(data: data, headers: headers, method: METHOD_PUT)));
  }

  /// send a post request
  Future<Response> post(String path,
      {dynamic data,
      Map<String, dynamic> headers,
      CancelToken cancelToken}) async {
    return _sendRequest(
        path,
        await _mergeOptions(
            RequestOptions(data: data, headers: headers, method: METHOD_POST)));
  }

  /// send a get request
  Future<Response> get(String path,
      {dynamic data,
      Map<String, dynamic> headers,
      CancelToken cancelToken}) async {
    return _sendRequest(
        path,
        await _mergeOptions(
            RequestOptions(data: data, headers: headers, method: METHOD_GET)));
  }

  Future<Response> _sendRequest(String path, RequestOptions options,
      {CancelToken cancelToken}) async {
    try {
      return await _dio.request(path,
          options: options, cancelToken: cancelToken);
    } on DioError {
      return null;
    }
  }

  Future<RequestOptions> _mergeOptions(RequestOptions newOptions) async {
    // default options
    var oldOps = await _buildDefaultOptions(newOptions);
    // append new options
//    if (newOptions != null) {
//      // append new Headers
//      var newHeaders = newOptions.headers;
//      if (newHeaders != null) {
//        oldOps.headers.addAll(newHeaders);
//      }

      // merge options
//      oldOps = oldOps.merge(
//          connectTimeout: newOptions.connectTimeout,
//          receiveTimeout: newOptions.receiveTimeout,
//          data: newOptions.data,
//          extra: newOptions.extra,
//          contentType: newOptions.contentType,
//          method: newOptions.method);
//    }
    oldOps.data=FormData.from(newOptions.data);
    return oldOps;
  }

  /// default options
  /// headers, timeout time, base url,...
  Future<RequestOptions> _buildDefaultOptions(RequestOptions options) async {
    options.baseUrl = Api.SMART_HOST;
    options.connectTimeout = CONNECTION_TIMEOUT;
    options.receiveTimeout = RECEIVE_TIMEOUT;
    if (options.headers != null) {
      options.headers.addAll(await _getDefaultHeaders());
    } else {
      options.headers = await _getDefaultHeaders();
    }
    return options;
//    return RequestOptions(
//        baseUrl: Api.SMART_HOST,
//        connectTimeout: CONNECTION_TIMEOUT,
//        receiveTimeout: RECEIVE_TIMEOUT,
//        headers: await _getDefaultHeaders());
  }

  Future<Map<String, dynamic>> _getDefaultHeaders() async {
    Map<String, dynamic> headers = {
      _ENCODING: 'identity',
      _Accept: _HEADER_ACCEPT_TYPE
    };
    return headers;
  }

  DioError _onErrorInterceptor(DioError error) {
    print('request error !!!!!!!!!!!!!!!!!! \n \t\t ${error.toString()}');
    return error;
  }

  Response _onSuccessInterceptor(Response response) {
    print('************ onSuccess Response <<<<<<<<<<<<<<<<<');
    print('headers : \n');
    response.headers.forEach((name, value) {
      print('\t\t $name : $value \n');
    });
    print('params : ${response.request.data}');
    print('data : ${response.data}');
    return response;
  }

  RequestOptions _onRequestInterceptor(RequestOptions options) {
    print('''*********** onSend Request >>>>>>>>>>>>>>>>>>>>>> \n
      baseUrl : ${options.baseUrl}
      path : ${options.path}
      ''');
    _parseHeaders(options.headers);
    return options;
  }

  _parseHeaders(Map<String, dynamic> headers) {
    print('headers : \n');
    headers.forEach((name, value) {
      print('\t\t $name : $value \n');
    });
  }

//  _setProxy() async {
//    print('_setProxy');
//    var address = await SPUtil.get(PROXY_ADDRESS);
//    if (address.length > 0) {
//      Fluttertoast.showToast(msg: '正在使用代理 : $address');
//      _dio.onHttpClientCreate = (client) {
//        client.findProxy = (uri) {
//          return "PROXY $address";
//        };
//      };
//    }
//  }
}
