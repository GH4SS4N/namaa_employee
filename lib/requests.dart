import 'package:parse_server_sdk/parse_server_sdk.dart';

Future<Parse> initializeParse() async {
  return await Parse().initialize('OzrokmU22cgyApcIL7XMkNvADiuxuro1B5SRJ8Yy',
      'https://parseapi.back4app.com/',
      clientKey: 'yQXy4KHzCutNlZOtToTsRU7AsHXqMts6oPaloj58', debug: true);
}

Future<ParseObject> createReminderDonor(String name, String phoneNumber) async {
  final newReminderDonor = ParseObject('ReminderDonor');

  newReminderDonor.set('name', name);
  newReminderDonor.set('phoneNumber', phoneNumber);

  final response = await newReminderDonor.save();
  return response.result;
}

Future<ParseObject> createReminder(ParseObject donor, String note, String reply,
    int year, int month, int day) async {
  final newReminder = ParseObject('Reminder');

  newReminder.set('donor', donor);
  newReminder.set('date', DateTime(year, month, day));
  newReminder.set('note', note);
  newReminder.set('reply', reply);

  final response = await newReminder.save();
  return response.result;
}

Future deleteReminder(ParseObject reminder) async {
  await reminder.delete();
}

// returns null if no reminders were found
Future<List<ParseObject>> getRemindersToday() async {
  final current = DateTime.now();
  final today = DateTime(current.year, current.month, current.day);

  final query = QueryBuilder(ParseObject('Reminder'))
    ..whereEqualTo(
      'date',
      {'__type': 'Date', 'iso': today.toIso8601String()},
    );

  final response = await query.query();
  return response.results;
}

// returns null if no reminders were found
Future<List<ParseObject>> getReminders(ParseObject reminderDonor) async {
  final query = QueryBuilder(ParseObject('Reminder'))
    ..whereEqualTo('donor', reminderDonor);

  final response = await query.query();
  return response.results;
}

Future<List<ParseObject>> getReminderDonors(String searchNumber) async {
  final query = QueryBuilder(ParseObject('ReminderDonor'))
    ..whereContains('phoneNumber', searchNumber);

  final response = await query.query();
  return response.results;
}