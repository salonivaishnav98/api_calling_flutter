/// status : 200
/// message : "Login successful"
/// data : {"id":47,"unique_id":"b68de1ef-daff-47ca-abb8-fb963cdd50da","first_name":"saloni","last_name":"v","username":"sv","email":"sv@gmail.com","proPic":null,"last_login":"2024-02-28T12:55:30.575891+05:30"}

class LoginApi {
  LoginApi({
      num? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  LoginApi.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? _status;
  String? _message;
  Data? _data;
LoginApi copyWith({  num? status,
  String? message,
  Data? data,
}) => LoginApi(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  num? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// id : 47
/// unique_id : "b68de1ef-daff-47ca-abb8-fb963cdd50da"
/// first_name : "saloni"
/// last_name : "v"
/// username : "sv"
/// email : "sv@gmail.com"
/// proPic : null
/// last_login : "2024-02-28T12:55:30.575891+05:30"

class Data {
  Data({
      num? id, 
      String? uniqueId, 
      String? firstName, 
      String? lastName, 
      String? username, 
      String? email, 
      dynamic proPic, 
      String? lastLogin,}){
    _id = id;
    _uniqueId = uniqueId;
    _firstName = firstName;
    _lastName = lastName;
    _username = username;
    _email = email;
    _proPic = proPic;
    _lastLogin = lastLogin;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _uniqueId = json['unique_id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _username = json['username'];
    _email = json['email'];
    _proPic = json['proPic'];
    _lastLogin = json['last_login'];
  }
  num? _id;
  String? _uniqueId;
  String? _firstName;
  String? _lastName;
  String? _username;
  String? _email;
  dynamic _proPic;
  String? _lastLogin;
Data copyWith({  num? id,
  String? uniqueId,
  String? firstName,
  String? lastName,
  String? username,
  String? email,
  dynamic proPic,
  String? lastLogin,
}) => Data(  id: id ?? _id,
  uniqueId: uniqueId ?? _uniqueId,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  username: username ?? _username,
  email: email ?? _email,
  proPic: proPic ?? _proPic,
  lastLogin: lastLogin ?? _lastLogin,
);
  num? get id => _id;
  String? get uniqueId => _uniqueId;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get username => _username;
  String? get email => _email;
  dynamic get proPic => _proPic;
  String? get lastLogin => _lastLogin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['unique_id'] = _uniqueId;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['username'] = _username;
    map['email'] = _email;
    map['proPic'] = _proPic;
    map['last_login'] = _lastLogin;
    return map;
  }

}