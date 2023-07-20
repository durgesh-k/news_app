import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  const Error({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black.withOpacity(0.05), width: 2)),
      child: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              color: Colors.red.withOpacity(0.2),
              size: 50,
            ),
            Text(
              'Error',
              style: TextStyle(
                  fontFamily: 'SemiBold',
                  color: Colors.red.withOpacity(0.2),
                  fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  final FlutterErrorDetails errorDetails;
  const ErrorScreen({
    Key? key,
    required this.errorDetails,
  })  : assert(errorDetails != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(color: Colors.black.withOpacity(0.05), width: 2)),
          child: Padding(
            padding: const EdgeInsets.all(48.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline_rounded,
                  color: Colors.red.withOpacity(0.2),
                  size: 50,
                ),
                Text(
                  'Error',
                  style: TextStyle(
                      fontFamily: 'SemiBold',
                      color: Colors.red.withOpacity(0.2),
                      fontSize: 30),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
