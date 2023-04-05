import 'package:flutter/material.dart';

class LattersWidget extends StatefulWidget {
  final String latter;
  final int numberOfLetters;
  final Function onDragCompleted;
  bool isCompleted;

  LattersWidget({
    Key? key,
    required this.isCompleted,
    required this.latter,
    required this.numberOfLetters,
    required this.onDragCompleted,
  }) : super(key: key);

  @override
  State<LattersWidget> createState() => _LattersWidgetState();
}

class _LattersWidgetState extends State<LattersWidget> {
  final TextStyle buttonTextStyle = const TextStyle(
      color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500);

  bool isCompleted = false;
  @override
  Widget build(BuildContext context) {
    String veriable = widget.latter;
    double size =
        (MediaQuery.of(context).size.width / (widget.numberOfLetters * 1.2));
    return IgnorePointer(
      ignoring: isCompleted,
      child: Draggable<String>(
        onDragCompleted: () {
          widget.isCompleted = true;
          setState(() {});
        },
        data: veriable,
        childWhenDragging: Material(
          child: SizedBox(
            height: size,
          ),
        ),
        feedback: widget.isCompleted
            ? SizedBox(
                height: size,
              )
            : ButtonView(
                size: size,
                latter: widget.latter,
                buttonTextStyle: buttonTextStyle),
        child: widget.isCompleted
            ? SizedBox(
                height: size,
              )
            : ButtonView(
                size: size,
                latter: widget.latter,
                buttonTextStyle: buttonTextStyle),
      ),
    );
  }
}

class ButtonView extends StatelessWidget {
  const ButtonView({
    Key? key,
    required this.size,
    required this.latter,
    required this.buttonTextStyle,
  }) : super(key: key);

  final double size;
  final String latter;
  final TextStyle buttonTextStyle;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        child: Container(
          alignment: Alignment.center,
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 28, 108, 173),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            latter,
            style: buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
