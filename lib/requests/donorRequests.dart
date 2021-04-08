import 'package:parse_server_sdk/parse_server_sdk.dart';

Future<List<ParseObject>> getDonationsOf(ParseObject donor) async {
  final query = QueryBuilder(ParseObject('Donation'))
    ..whereEqualTo('donor', donor);

  final response = await query.query();
  return response.results;
}

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
    String wireNumber, double amount, String note) async {
  final newDonation = ParseObject('Donation');

  newDonation.set('donor', donor);
  newDonation.set('program', program);
  newDonation.set('wireNumber', wireNumber);
  newDonation.set('amount', amount);
  newDonation.set('note', note);

  final response = await newDonation.save();
  return response.result;
}
