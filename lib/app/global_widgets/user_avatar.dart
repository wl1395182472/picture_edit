import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final int? userId;
  final double size;
  final double borderRadius;

  const UserAvatar({
    super.key,
    this.userId,
    this.size = 40.0,
    this.borderRadius = 6.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      alignment: Alignment.center,
      child: userId == null
          ? const SizedBox()
          : Text(
              userId.toString(),
              maxLines: 1,
            ),
    );
  }
}
