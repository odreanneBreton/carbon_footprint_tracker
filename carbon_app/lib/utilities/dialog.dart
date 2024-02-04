import 'package:carbon_app/views/my_stats.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:google_fonts/google_fonts.dart';

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
  int gazPrice,
  int carbon,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Nice!',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            )),
        content: Column(
          children: [
            SizedBox(height: 100),
            Text("You saved \$ $gazPrice ",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                )),
            SizedBox(height: 100),
            Text("You saved $carbon Kg CO2",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                )),
            SizedBox(height: 100),
            Icon(Icons.nature_people, size: 60),
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
