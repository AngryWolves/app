class LoginResponse {
  int status;
  UserData userData;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['errorCode'];
    var data = json['data'];
    if (data != null) {
      userData = UserData.fromJson(data);
    }
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
