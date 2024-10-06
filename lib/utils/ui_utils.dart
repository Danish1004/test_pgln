import 'package:flutter/material.dart';

class UiUtils {
  static void showSnackBar(BuildContext context,
      {String? title = "",
      required String content,
      Color backgroundColor = Colors.red}) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                  visible: title != null && title.isNotEmpty,
                  child: Column(
                    children: [
                      Text(
                        title!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                  )),
              Text(
                content,
                overflow: TextOverflow.visible,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.white,
                    ),
                maxLines: 2,
              ),
            ],
          ),
          backgroundColor: backgroundColor,
          duration: const Duration(seconds: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.only(
            bottom: 12.0,
            left: 16.0,
            right: 16.0,
          ),
        ),
        snackBarAnimationStyle: AnimationStyle(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 200),
        ));
  }
}
