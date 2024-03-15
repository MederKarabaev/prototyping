import 'package:flutter/material.dart';

class ResizebleWidget extends StatefulWidget {
  const ResizebleWidget(
      {super.key, required this.child, required this.onDelete});

  final Widget child;
  final Function() onDelete;

  @override
  State<ResizebleWidget> createState() => _ResizebleWidgetState();
}

const ballDiameter = 30.0;

class _ResizebleWidgetState extends State<ResizebleWidget> {
  double size = 200;

  double top = 60;
  double left = 60;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: top,
          left: left,
          child: ManipulatingBall(
            onDrag: (dx, dy) {
              setState(() {
                top = top + dy;
                left = left + dx;
              });
            },
            child: Container(
              height: size,
              width: size,
              color: Colors.transparent,
              child: Center(child: widget.child),
            ),
          ),
        ),
        // top left
        Positioned(
          top: top - ballDiameter / 2,
          left: left - ballDiameter / 2,
          child: ManipulatingBall(
            onDrag: (dx, dy) {
              var mid = (dx + dy) / 2;
              var newHeight = size - 2 * mid;
              var newWidth = size - 2 * mid;

              setState(() {
                size = newHeight > 0 ? newHeight : 0;
                size = newWidth > 0 ? newWidth : 0;
                top = top + mid;
                left = left + mid;
              });
            },
          ),
        ),
        // top middle
        Positioned(
          top: top - ballDiameter / 2,
          left: left + size / 2 - ballDiameter,
          child: InkWell(
            onTap: widget.onDelete,
            child: const Icon(Icons.delete),
          ),
        ),

        // top right
        Positioned(
          top: top - ballDiameter / 2,
          left: left + size - ballDiameter / 2,
          child: ManipulatingBall(
            onDrag: (dx, dy) {
              var mid = (dx + (dy * -1)) / 2;

              var newHeight = size + 2 * mid;
              var newWidth = size + 2 * mid;

              setState(() {
                size = newHeight > 0 ? newHeight : 0;
                size = newWidth > 0 ? newWidth : 0;
                top = top - mid;
                left = left - mid;
              });
            },
          ),
        ),

        // bottom right
        Positioned(
          top: top + size - ballDiameter / 2,
          left: left + size - ballDiameter / 2,
          child: ManipulatingBall(
            onDrag: (dx, dy) {
              var mid = (dx + dy) / 2;

              var newHeight = size + 2 * mid;
              var newWidth = size + 2 * mid;

              setState(() {
                size = newHeight > 0 ? newHeight : 0;
                size = newWidth > 0 ? newWidth : 0;
                top = top - mid;
                left = left - mid;
              });
            },
          ),
        ),

        // bottom left
        Positioned(
          top: top + size - ballDiameter / 2,
          left: left - ballDiameter / 2,
          child: ManipulatingBall(
            onDrag: (dx, dy) {
              var mid = ((dx * -1) + dy) / 2;

              var newHeight = size + 2 * mid;
              var newWidth = size + 2 * mid;

              setState(() {
                size = newHeight > 0 ? newHeight : 0;
                size = newWidth > 0 ? newWidth : 0;
                top = top - mid;
                left = left - mid;
              });
            },
          ),
        ),
      ],
    );
  }
}

class ManipulatingBall extends StatefulWidget {
  const ManipulatingBall({
    super.key,
    required this.onDrag,
    this.child,
  });

  final Function onDrag;
  final Widget? child;

  @override
  State<ManipulatingBall> createState() => _ManipulatingBallState();
}

class _ManipulatingBallState extends State<ManipulatingBall> {
  late double initX;
  late double initY;

  _handleDrag(details) {
    setState(() {
      initX = details.globalPosition.dx;
      initY = details.globalPosition.dy;
    });
  }

  _handleUpdate(details) {
    var dx = details.globalPosition.dx - initX;
    var dy = details.globalPosition.dy - initY;
    initX = details.globalPosition.dx;
    initY = details.globalPosition.dy;
    widget.onDrag(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _handleDrag,
      onPanUpdate: _handleUpdate,
      child: widget.child ??
          Container(
            width: ballDiameter,
            height: ballDiameter,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
          ),
    );
  }
}
