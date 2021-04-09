import 'package:parse_server_sdk/parse_server_sdk.dart';

Future updateDonation(ParseObject donation, {String note, int status}) async {
  if (note != null) donation.set('note', note);
  if (status != null) donation.set('status', status);

  await donation.save();
}

Future<ParseObject> getDonor(String phoneNumber) async {
  final query = QueryBuilder(ParseObject('Donor'))
    ..whereEqualTo('phoneNumber', phoneNumber);

  final response = await query.query();
  return response.result;
}

Future<List<ParseObject>> getDonations() async {
  final response = await ParseObject('Donation').getAll();
  return response.results;
}
