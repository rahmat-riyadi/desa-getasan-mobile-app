import 'package:flutter/widgets.dart';

class InputLabel extends StatelessWidget {

  final String label;

  const InputLabel({
    Key? key, required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        color: Color(0xFF5B5B5B),
        fontSize: 14,
        fontWeight: FontWeight.w600
      ),
    );
  }
}