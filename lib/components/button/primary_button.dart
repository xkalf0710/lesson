import 'package:lesson/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PrimaryButton extends StatefulWidget {
  Function onAction;
  final String title;
  final bool loading;
  final bool outLine;
  final double? width;

  PrimaryButton({
    required this.onAction,
    this.loading = false,
    this.outLine = false,
    required this.title,
    this.width,
    super.key,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        widget.onAction();
      },
      child: Container(
        width: widget.width ?? double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 19),
        decoration: widget.outLine
            ? BoxDecoration(
          border: Border.all(color: colorPrimary, width: 1),
          borderRadius: BorderRadius.circular(27.0),
        )
            : BoxDecoration(
          color: colorPrimary,
          borderRadius: BorderRadius.circular(27.0),
        ),
        child: widget.outLine
            ? Center(
          child: widget.loading
              ? const SpinKitThreeBounce(size: 18, color: colorPrimary)
              : Text(
            widget.title,
            style:
            const TextStyle(fontSize: 16, color: colorPrimary),
          ),
        )
            : Center(
          child: widget.loading
              ? const SpinKitThreeBounce(size: 18, color: Colors.white)
              : Text(
            widget.title,
            style:
            const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}