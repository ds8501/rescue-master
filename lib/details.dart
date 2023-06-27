import 'apiModel.dart';
import 'modelhelper.dart';

String firstname = 'prince';
String lastname = 'singh';
String desc = 'fever';
String location = 'chennai';
List<ApiCall>? data;
var isLoaded = false;

getData() async {
  // print('calling function');
  List<ApiCall>? responseData = await baseclient().get();

  if (responseData != null) {
    isLoaded = true;
    print('hello');
    data = responseData;
    // firstname = data![0].firstName;

    // setState(() {
    //   data = responseData;
    //   abc = data![0].firstName;
    //   print(abc);
    //   print('HIIIIII');
    //   isLoaded = true;
    // });
  } else {
    print('hiiiiiiii');
  }
}
