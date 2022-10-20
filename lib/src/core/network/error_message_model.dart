/// status_message : ""
/// status_code : 200
/// message : ""

class ErrorMessageModel {
  ErrorMessageModel({
      String? statusMessage, 
      num? statusCode, 
      String? message,}){
    _statusMessage = statusMessage;
    _statusCode = statusCode;
    _message = message;
}

  ErrorMessageModel.fromJson(dynamic json) {
    _statusMessage = json['status_message'];
    _statusCode = json['status_code'];
    _message = json['message'];
  }
  String? _statusMessage;
  num? _statusCode;
  String? _message;

  String? get statusMessage => _statusMessage;
  num? get statusCode => _statusCode;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status_message'] = _statusMessage;
    map['status_code'] = _statusCode;
    map['message'] = _message;
    return map;
  }

}