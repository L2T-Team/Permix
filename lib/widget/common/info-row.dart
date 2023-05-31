import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  const InfoRow(this.icon, this.label, {Key? key}) : super(key: key);

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1),
          ),
        ],
      ),
    );
  }
}
