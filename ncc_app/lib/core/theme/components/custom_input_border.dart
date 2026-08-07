import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class CustomInputBorder extends OutlineInputBorder {
  const CustomInputBorder();

  @override
  BorderRadius get borderRadius => BorderRadius.circular(kSmallRadius); // You can customize the radius if needed
}
