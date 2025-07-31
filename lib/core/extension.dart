import 'package:flutter/material.dart';

extension Spacing on num {
  SizedBox get ws => SizedBox(
        width: toDouble(),
      );
  SizedBox get hs => SizedBox(
        height: toDouble(),
      );
}
