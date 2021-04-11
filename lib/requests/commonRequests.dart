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

Future<List<ParseObject>> getEmployees() async {
  var response = await ParseObject('Employee').getAll();
  return response.results;
}

Future<ParseObject> getDonor(String phoneNumber) async {
  final query = QueryBuilder(ParseObject('Donor'))
    ..whereEqualTo('phoneNumber', phoneNumber);

  final response = await query.query();
  return response.results[0];
}

Future<ParseObject> createMessage(
    ParseObject donor, String text, bool fromDonor) async {
  final newMessage = ParseObject('Message')
    ..set('donor', donor)
    ..set('fromDonor', fromDonor)
    ..set('text', text);
  final response = await newMessage.save();
  return response.result;
}
