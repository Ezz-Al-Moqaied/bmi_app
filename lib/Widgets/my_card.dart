import 'package:flutter/material.dart';

Widget MyCard(
        {required Function()? onTap,
        required Widget child,
        Color colors = Colors.grey}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: colors,
        ),
        child: child,
      ),
    );
