import 'dart:io';

import 'package:parse_server_sdk/parse_server_sdk.dart';

// registers a new donor
Future<ParseObject> signupDonor(
  String phoneNumber,
  String name,
  String bankNumber,
  String idNumber,
  String password,
  File idPicture,
) async {
  var user = ParseUser(phoneNumber, password, null);
  var response = await user.signUp(allowWithoutEmail: true);
  user = response.result;

  final donor = ParseObject('Donor')
    ..set('bankNumber', bankNumber)
    ..set('idNumber', idNumber)
    ..set('idPicture', ParseFile(idPicture))
    ..set('user', user)
    ..set('name', name)
    ..set('phoneNumber', phoneNumber);

  response = await donor.save();

  return response.result;
}

// registers a new employee
Future<ParseObject> signupEmployee(
  String phoneNumber,
  String name,
  String employeeId,
  String type,
  String password,
  String formLink,
  String formResultLink,
  String branch,
) async {
  var user = ParseUser(phoneNumber, password, null);
  var response = await user.signUp(allowWithoutEmail: true);
  user = response.result;

  final employee = ParseObject('Employee')
    ..set('name', name)
    ..set('employeeId', employeeId)
    ..set('type', type)
    ..set('formLink', formLink)
    ..set('formResultLink', formResultLink)
    ..set('branch', branch)
    ..set('user', user)
    ..set('phoneNumber', phoneNumber);

  response = await employee.save();

  return response.result;
}

// returns either an Employee ParseObject or a Donor
// check by value.parseClassName == "Donor"
Future<ParseObject> login(String phoneNumber, String password) async {
  var user = ParseUser(phoneNumber, password, null);

  var response = await user.login();

  if (!response.success) throw response.error;

  user = response.result;

  var query = QueryBuilder(ParseObject('Employee'))
    ..whereEqualTo('user', user)
    ..setLimit(1);

  response = await query.query();

  // if querying the employee didn't show any results
  if (response.count == 0) {
    // query for donors
    query = QueryBuilder(ParseObject('Donor'))
      ..whereEqualTo('user', user)
      ..setLimit(1);

    response = await query.query();

    return response.results[0];
  }

  return response.results[0];
}
