 
import 'OssTokenModel.dart';

class OssTokenDataModel {
  String msg;
  String status;

  int code;
  OssTokenModel data;

  OssTokenDataModel.fromMap(Map<String, dynamic> map) {
    code = map['code'];
    status = map['status'];
    msg = map["msg"];
    if (map['data'] != null) {
      data = OssTokenModel.fromMap(map['data']);
    }
  }

  @override
  String toString() {
    return 'OssTokenDataModel{msg: $msg, status: $status, data: $data}';
  }
}
