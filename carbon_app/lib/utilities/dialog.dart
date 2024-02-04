import 'package:carbon_app/views/my_stats.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

Future<void> showYesMetroDialog(
  BuildContext context,
  String text,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Metro Station: '),
        content: Text(text),
        actions: [
          TextButton(
              onPressed: () {
                // use overlay instead?
                Navigator.of(context).pop();
              },
              child: const Text('Yes!')),
        ],
      );
    },
  );
}

Future<void> showNoMetroDialog(
  BuildContext context,
  String text,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Wait ...'),
        content: Text(text),
        actions: [
          TextButton(
              onPressed: () {
                // use overlay instead?
                Navigator.of(context).pop();
              },
              child: const Text('Yes!')),
        ],
      );
    },
  );
}

Future<void> showWinMetroDialog(
  BuildContext context,
  String text,
  String lastStation,
  double gazPrice,
  double carbon,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Nice!'),
        content: Column(
          children: [
            Text(text),
            Text("You saved \$ $gazPrice "),
            Text("You saved $carbon CO2")
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {
                // use overlay instead?
                Navigator.of(context).pop();
              },
              child: const Text('Yes!')),
        ],
      );
    },
  );
}
