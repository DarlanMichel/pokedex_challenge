import 'package:flutter/material.dart';

class StatsBar extends StatelessWidget {
  final int valueBase;
  final Color principalColor;
  const StatsBar(
      {super.key, required this.valueBase, required this.principalColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 21,
          height: 16,
          child: Text(
            valueBase.toString().padLeft(3, '0'),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: const Color(0xff1D1D1D),
                ),
          ),
        ),
        const SizedBox(width: 8),
        Stack(
          children: [
            Container(
              height: 4,
              width: MediaQuery.of(context).size.width - 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: principalColor.withOpacity(0.2)),
            ),
            Container(
              height: 4,
              width:
                  ((MediaQuery.of(context).size.width - 130) * valueBase) / 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(2),
                    topLeft: const Radius.circular(2),
                    bottomRight: valueBase == 250
                        ? const Radius.circular(2)
                        : Radius.zero,
                    topRight: valueBase == 250
                        ? const Radius.circular(2)
                        : Radius.zero,
                  ),
                  color: principalColor),
            )
          ],
        )
      ],
    );
  }
}
