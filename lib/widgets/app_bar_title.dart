import 'package:flutter/material.dart';
import 'package:pingolearn_assignment/shared/shared.dart';

class AppBarTitle extends StatelessWidget {
  final String title;

  const AppBarTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Expanded(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 4),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Baseline(
            baseline: -5,
            baselineType: TextBaseline.alphabetic,
            child: Text(
              SharedPrefs.instance.appVersionCode(),
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ),
        const SizedBox(width: 4),
      ],
    );
  }
}
