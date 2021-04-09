import 'package:parse_server_sdk/parse_server_sdk.dart';

Future<Parse> initializeParse() async {
  return await Parse().initialize('OzrokmU22cgyApcIL7XMkNvADiuxuro1B5SRJ8Yy',
      'https://parseapi.back4app.com/',
      clientKey: 'yQXy4KHzCutNlZOtToTsRU7AsHXqMts6oPaloj58', debug: true);
}

Future<List<ParseObject>> getDonationsOf(ParseObject donor) async {
  final query = QueryBuilder(ParseObject('Donation'))
    ..whereEqualTo('donor', donor);

  final response = await query.query();
  return response.results;
}
