/// status : 201
/// message : "UserData"
/// data : {"first_name":"saloni1","last_name":"fdf","username":"sv1sd","email":"sv@gmail.comm","proPic":null}

class RegisterApi {
  RegisterApi({
      num? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  RegisterApi.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? _status;
  String? _message;
  Data? _data;
RegisterApi copyWith({  num? status,
  String? message,
  Data? data,
}) => RegisterApi(  status: status ?? _status,
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

/// first_name : "saloni1"
/// last_name : "fdf"
/// username : "sv1sd"
/// email : "sv@gmail.comm"
/// proPic : null

class Data {
  Data({
      String? firstName, 
      String? lastName, 
      String? username, 
      String? email, 
      dynamic proPic,}){
    _firstName = firstName;
    _lastName = lastName;
    _username = username;
    _email = email;
    _proPic = proPic;
}

  Data.fromJson(dynamic json) {
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _username = json['username'];
    _email = json['email'];
    _proPic = json['proPic'];
  }
  String? _firstName;
  String? _lastName;
  String? _username;
  String? _email;
  dynamic _proPic;
Data copyWith({  String? firstName,
  String? lastName,
  String? username,
  String? email,
  dynamic proPic,
}) => Data(  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  username: username ?? _username,
  email: email ?? _email,
  proPic: proPic ?? _proPic,
);
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get username => _username;
  String? get email => _email;
  dynamic get proPic => _proPic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['username'] = _username;
    map['email'] = _email;
    map['proPic'] = _proPic;
    return map;
  }

}