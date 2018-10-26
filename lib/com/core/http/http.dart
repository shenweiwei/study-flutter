import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

class Http {
  Dio dio = new Dio();

  final Options option;

  Http({this.option}) {
    dio.options = this.defaultOptions();
  }

  Http.options(this.option) {
    if (option == null) throw Exception('http options is empty');
    dio.options = this.option;
  }

  defaultOptions() {
    Options options = new Options(
        connectTimeout: 5000,
        receiveTimeout: 5000,
        headers: {'user-agent': 'dio'});
    return options;
  }

  Future<Response<T>> request<T>(String uri,
      {Options options, String key, Object data}) async {
    return await this.dio.request(uri, data: data);
  }

  Future<Response<T>> post<T>(String uri, Object data,
      {Options options}) async {
    return await this.dio.post(uri, data: data);
  }

  Future<Response<T>> get<T>(String uri, {Options options}) async {
    return await this.dio.get(uri);
  }

  Future<Response<T>> put<T>(String uri, String key, Object data) async {
    return await this.dio.put(uri + key, data: data);
  }

  Future<Response<T>> delete<T>(String uri, String key) async {
    return await this.dio.delete(uri + key);
  }

  Future<Response<T>> uploadFile<T>(String uri, File file, String fileName,
      {Map data}) async {
    FormData formData = new FormData.from({
      'file': new UploadFileInfo(file, fileName),
      'suffixName': data['suffixName'],
      'describe': data['describe']
    });
    print(data);
    return await this.dio.post(uri, data: formData);
  }
}
