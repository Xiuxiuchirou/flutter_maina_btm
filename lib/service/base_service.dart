import 'dart:async';
import 'dart:io';
import 'package:flui/flui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:flutter_mai_na/common/common_check.dart';

//action 接口地址 formdata参数
Future postRequest(action,
    {shopid, token, formData, BuildContext context, bool load}) async {
 
  var closeLoading;
  Options options = Options(headers: {
    HttpHeaders.contentTypeHeader: "contentType : application/json",
    'token': token == null ? '5de1778e3b9b48cd9d2eb747c7644e67' : token
  }, receiveTimeout: 600000);
  print("发起请求XXXXXXXXXXXXXXXXXXXXXXX");
  Response response;
  Dio dio = new Dio();
  String url = action;
  if (context != null && load) {
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options) {
      closeLoading = FLToast.loading(text: '请求中....');
    }, onResponse: (response) async {
      await closeLoading();
    }, onError: (e) async {
      print('POST REQUEST ERROR =====> ' + e.toString());
      await closeLoading();
    }));
  }
  if (formData == null) {
    response = await dio.post(url, options: options);
  } else {
    print("-------$formData");
    response = await dio.post(url, data: formData, options: options);
  }
  if (response.statusCode == 200) {
    return response.data;
  } else {
    throw Exception('后端接口出现异常:$url');
  }
}

//action 接口地址 formdata参数
Future getRequest(action, {shopid, token, formData, bool load = false}) async {
  var closeLoading;
  Options options = Options(headers: {
    HttpHeaders.acceptHeader: "accept: application/json",
    'token': token == null ? '5de1778e3b9b48cd9d2eb747c7644e67' : token
  });
  Response response;
  Dio dio = new Dio();
  String url = action;
  if (load) {
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options) {
      closeLoading = FLToast.loading(text: '请求中...');
    }, onResponse: (response) {
      //  await closeLoading();
    }, onError: (e) {
      print('GET REQUEST ERROR =====> ' + e.toString());
      // await  closeLoading();
      //  await closeLoading();
      // await showDialogYesOrNo_new(context, title: "网络请求异常(GET)", tip: true);
    }));
  }
  if (formData == null) {
    response = await dio.get(url, options: options);
  } else {
    response = await dio.get(url, queryParameters: formData, options: options);
  }
//
  if (response.statusCode == 200) {
    return response.data;
  } else {
    throw Exception('后端接口出现异常');
  }
}
