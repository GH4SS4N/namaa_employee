import 'package:parse_server_sdk/parse_server_sdk.dart';

Future<List<ParseObject>> getMessagesOf(ParseObject donor) async {
  final query = QueryBuilder(ParseObject('Message'))
    ..whereEqualTo('donor', donor);

  final response = await query.query();
  return response.results;
}

Future<List<ParseObject>> getAnnouncements() async {
  final response = await ParseObject('Announcement').getAll();
  return response.results;
}

Future<List<ParseObject>> getPrograms() async {
  final response = await ParseObject('Program').getAll();
  return response.results;
}

Future<ParseObject> createDonation(ParseObject donor, ParseObject program,
    String wireNumber, double amount) async {
  final newDonation = ParseObject('Donation')
    ..set('donor', donor)
    ..set('program', program)
    ..set('wireNumber', wireNumber)
    ..set('amount', amount);

  final response = await newDonation.save();
  return response.result;
}

Future<ParseObject> createMessage(ParseObject donor, String text) async {
  final newMessage = ParseObject('Message')
    ..set('donor', donor)
    ..set('fromDonor', true)
    ..set('text', text);
  final response = await newMessage.save();
  return response.result;
}
