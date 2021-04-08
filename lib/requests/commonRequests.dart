import 'package:parse_server_sdk/parse_server_sdk.dart';

Future<Parse> initializeParse() async {
  return await Parse().initialize('OzrokmU22cgyApcIL7XMkNvADiuxuro1B5SRJ8Yy',
      'https://parseapi.back4app.com/',
      clientKey: 'yQXy4KHzCutNlZOtToTsRU7AsHXqMts6oPaloj58', debug: true);
}
