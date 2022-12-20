import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'statusRequest.dart';

import 'package:path/path.dart';

String _basicAuth = 'Basic ' + base64Encode(utf8.encode('hasan:hasan1234'));

Map<String, String> myHeaders = {'authorization': _basicAuth};

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkUrl, Map data) async {
    try {
      var response = await http.post(Uri.parse(linkUrl),
          body: data,
          headers: myHeaders,
          encoding: Encoding.getByName("utf-8"));
      if (response.statusCode >= 200 || response.statusCode < 300) {
        Map responseBody = jsonDecode(response.body);
        print(responseBody);
        return Right(responseBody);
      } else {
        print('============${response.statusCode}================');
        return const Left(StatusRequest.serverFailure);
      }
    } catch (e) {
      print('========phone=====================');
      print('========${e}=====================');
      print('========phone=====================');
      return const Left(StatusRequest.failure);
    }
  }

  Future<Either<StatusRequest, Map>> postRequestWithFile(
      String url, Map data, File file) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    var fileleng = await file.length();
    var stream = http.ByteStream(file.openRead());
    var multipartFile = http.MultipartFile('file', stream, fileleng,
        filename: basename(file.path));
    request.files.add(multipartFile);
    request.headers.addAll(myHeaders);
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    try {
      var myRequest = await request.send();

      var response = await http.Response.fromStream(myRequest);
      print('==============response==================');
      print(response);
      print('========================================');
      if (myRequest.statusCode == 200) {
        return Right(jsonDecode(response.body));
      } else {
        return const Left(StatusRequest.serverFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverFailure);
    }
  }
}
