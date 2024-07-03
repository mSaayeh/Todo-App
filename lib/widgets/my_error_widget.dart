import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({super.key, required this.message, this.onTryAgain});

  final String message;
  final void Function()? onTryAgain;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          if (onTryAgain != null)
            ElevatedButton(
              onPressed: onTryAgain,
              child: const Text("Try Again"),
            )
        ],
      ),
    );
  }
}
