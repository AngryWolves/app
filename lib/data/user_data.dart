class LoginResponse {
  int result;
  String msg;
  String data;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    result = json['errorCode'];
    msg = json['msg'];
    data = json['data'];
//    var data = json['data'];
//    if (data != null) {
//      userData = UserData.fromJson(data);
//    }
  }
}

class UserData {
  String token;
  num expireAt;

  UserData.fromJson(Map<String, dynamic> json)
      : token = json['token'],
        expireAt = json['access_token_expire_at'];
}

class Account {
  Account(this.token, this.username);

  String token;
  String username;

  Account.fromJson(Map<String, dynamic> json)
      : token = json['token'],
        username = json['username'];

  Map<String, dynamic> toJson() => {
        'token': token,
        'username': username,
      };

  Account.empty();
}
