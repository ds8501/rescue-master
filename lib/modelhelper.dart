import 'package:http/http.dart' as http;
import 'package:rescue/apiModel.dart';

const String URL = 'http://52.205.92.82:8000/victims/victims/';

class baseclient {
  var client = http.Client();

  Future<List<ApiCall>?> get() async {
    try {
      var url = Uri.parse(URL);
      var response = await client.get(url);

      if (response.statusCode == 200) {
        var json = response.body;
        List<ApiCall> apiCalls = apiCallFromJson(json);
        print(apiCalls);
        return apiCalls;
      } else {
        print('HTTP request failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      print('An error occurred during the HTTP request: $error');
    }

    return null;
  }

  postData(data) {}
}
