import 'package:parse_server_sdk/parse_server_sdk.dart';

Future<ParseObject> createAnnouncement(String text) async {
  final newAnnouncement = ParseObject('Announcement')..set('text', text);

  final response = await newAnnouncement.save();
  return response.result;
}

Future<List<ParseObject>> getMessages() async {
  final response = await ParseObject('Message').getAll();
  return response.results;
}
