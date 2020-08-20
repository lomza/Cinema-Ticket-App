import 'dart:math' as Math;

import 'package:cinema_ticket_app/widgets/CircleSide.dart';
import 'package:flutter/material.dart';

class CircleClipper extends CustomClipper<Path> {
  final double radius;
  final CircleSide side;

  CircleClipper({@required this.radius, this.side = CircleSide.left});

  @override
  Path getClip(Size size) {
    final shapeBounds = Rect.fromLTRB(0, 0, size.width, size.height);

    Offset avatar;
    if (side == CircleSide.left) {
      avatar = Offset(shapeBounds.centerLeft.dx, shapeBounds.centerLeft.dy);
    } else if (side == CircleSide.right) {
      avatar = Offset(shapeBounds.centerRight.dx, shapeBounds.centerRight.dy);
    }

    final avatarBounds = Rect.fromCircle(center: avatar, radius: radius);
    Path path = Path()..moveTo(shapeBounds.left, shapeBounds.top);
    if (side == CircleSide.left) {
      path
        ..arcTo(avatarBounds, -Math.pi, Math.pi, false)
        ..arcTo(avatarBounds, 0, Math.pi, false)
        ..lineTo(shapeBounds.centerLeft.dx, shapeBounds.bottomLeft.dy)
        ..lineTo(shapeBounds.bottomRight.dx, shapeBounds.bottomRight.dy);
    } else if (side == CircleSide.right) {
      path
        ..lineTo(shapeBounds.centerLeft.dx, shapeBounds.bottomLeft.dy)
        ..lineTo(shapeBounds.bottomRight.dx, shapeBounds.bottomRight.dy)
        ..arcTo(avatarBounds, 0, Math.pi, false)
        ..arcTo(avatarBounds, -Math.pi, Math.pi, false);
    }
    path
      ..lineTo(shapeBounds.topRight.dx, shapeBounds.topRight.dy)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CircleClipper oldClipper) {
    return radius != oldClipper.radius || side != oldClipper.side;
  }
}
