import 'package:flutter/material.dart';

class GlobalErrorWidget extends StatelessWidget {
  final FlutterErrorDetails details;
  const GlobalErrorWidget({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.error_outline, size: 48, color: Colors.red),
              SizedBox(height: 12),
              Text(
                'Something went wrong',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
