import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaa_employee/pages/employee/searchpage/search.dart';

import '../../main.dart';

// final storeTypeSelectedProvider = StateProvider<String>((ref) => null);
final countrySelectedProvider = StateProvider<String>((ref) => "asdf");
// final citySelectedProvider = StateProvider<String>((ref) => "جدة");

class CDropdown extends ConsumerWidget {
  final StateProvider selectedState;
  final List<String> options;

  CDropdown({@required this.selectedState, @required this.options});

  @override
  Widget build(BuildContext context, watch) {
    final selected = watch(selectedState).state;

    return Container(
      height: 90,
      padding: EdgeInsets.all(24),
      child: options == null
          ? CircularProgressIndicator()
          : DropdownButton<String>(
              isExpanded: true,
              value: selected ?? options[0] ?? '',
              items: options
                  .map(
                    (String item) => DropdownMenuItem<String>(
                      child: Text(item),
                      value: item,
                    ),
                  )
                  .toList(),
              isDense: true,
              underline: Container(),
              onChanged: (String newValue) =>
                  context.read(selectedState).state = newValue,
            ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(color: green)),
    );
  }
}
