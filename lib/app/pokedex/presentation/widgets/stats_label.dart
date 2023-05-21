import 'package:flutter/material.dart';

class StatsLabel extends StatelessWidget {
  final Color principalColor;
  final String label;
  const StatsLabel(
      {super.key, required this.principalColor, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16,
      child: Text(
        label,
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: principalColor),
      ),
    );
  }
}
