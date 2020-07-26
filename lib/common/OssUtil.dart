import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

String bucketName = "pos-new-test";
String endpoint = "oss-cn-hangzhou.aliyuncs.com";

Future<Map> uploadDataToOss(File imageFile, String fileName) async {
  String policyBase64 = base64.encode(utf8.encode(
      '{"expiration": "2029-01-01T12:00:00.000Z","conditions": [["content-length-range", 0, 1048576000]]}'));

  String signature = base64.encode(
      Hmac(sha1, utf8.encode("aVJl4P8RRmparyw1mYaGc5tPzHatpN"))
          .convert(utf8.encode(policyBase64))
          .bytes);

  // File imageFile = new File(path);
  if (!await imageFile.exists()) {
    //文件不存在则直接退出
    return null;
  }

  BaseOptions options = new BaseOptions();
  options.responseType = ResponseType.plain;
  //创建dio对象
  Dio dio = new Dio(options);

  FormData data = new FormData.fromMap({
    'Filename': fileName,
    'key': fileName, //可以填写文件夹名（对应于oss服务中的文件夹）/
    'policy': policyBase64,
    'OSSAccessKeyId': "LTAI4FoJR4X9iT5tgY4zwpGv",
    'success_action_status': '200', //让服务端返回200，不然，默认会返回204
    'signature': signature,
    // 'file': new UploadFileInfo(imageFile, fileName)
    'file': await MultipartFile.fromFile(imageFile.path, filename: fileName)
  });

  Map returns = Map();
  try {
    Response response =
        await dio.post("https://$bucketName.$endpoint", data: data);
    returns['code'] = 0;
    print(response.headers);
    print(response.data);
    return returns;
  } on DioError catch (e) {
    print("get uploadImage error: $e");
  }
}
