import 'package:flutter/material.dart';

void showConfirmDialog({
  required BuildContext context,
  required Function onYesHandler,
  String title = 'Sure to remove?',
  Function? onNoHandler,
}) async {
  await showDialog(
    context: context,
    builder: (BuildContext ctx) {
      return AlertDialog(
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          // The "Yes" button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Flexible(
                  child: TextButton(
                      onPressed: () {
                        // Remove the box
                        onYesHandler();
                        // Close the dialog
                        Navigator.of(context).pop();
                      },
                      child: const Text('Yes')),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: ElevatedButton(
                      onPressed: () {
                        onNoHandler ?? Navigator.of(context).pop();
                      },
                      child: const Text('No')),
                )
              ],
            ),
          ),
        ],
      );
    },
  );
}
