import 'package:flutter/material.dart';

class LattersTargetWidget extends StatefulWidget {
  final String latter;
  final int numberOfLetters;
  var isFilled;
  final Function(int) ifTrue;
  final int index;
  LattersTargetWidget({
    Key? key,
    required this.latter,
    required this.numberOfLetters,
    required this.isFilled,
    required this.ifTrue,
    required this.index,
  }) : super(key: key);

  @override
  State<LattersTargetWidget> createState() => _LattersTargetWidgetState();
}

class _LattersTargetWidgetState extends State<LattersTargetWidget> {
  final TextStyle buttonTextStyle = const TextStyle(
      color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500);

  String veriable = " ";
  @override
  Widget build(BuildContext context) {
    var size =
        (MediaQuery.of(context).size.width / (widget.numberOfLetters * 1.2));
    return !widget.isFilled
        ? DragTarget<String>(
            onAccept: (data) {
              if (data == widget.latter) {
                widget.ifTrue(widget.index);
              }
              veriable = data;
              widget.isFilled = true;
              setState(() {});
            },
            builder: (context, _, __) {
              return Container(
                alignment: Alignment.center,
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 221, 222, 224),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: const Color.fromARGB(255, 193, 190, 190)),
                ),
              );
            },
          )
        : Container(
            alignment: Alignment.center,
            width: size,
            height: size,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 28, 108, 173),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              veriable,
              style: buttonTextStyle,
            ),
          );
  }
}
