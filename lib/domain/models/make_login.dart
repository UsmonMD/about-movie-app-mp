class MakeLogin {
  bool? success;
  String? expiresAt;
  String? requestToken;

  MakeLogin({this.success, this.expiresAt, this.requestToken});

  MakeLogin.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    expiresAt = json['expires_at'];
    requestToken = json['request_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['expires_at'] = expiresAt;
    data['request_token'] = requestToken;
    return data;
  }
}
