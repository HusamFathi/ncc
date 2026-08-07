import 'package:flutter/material.dart';

import '../../../utils/get_backend_errors_string.dart';
import 'error_text_widget.dart';

class FieldsErrorTextWidget extends StatelessWidget {
  final Map<String, List<String>> errorFields;

  const FieldsErrorTextWidget({super.key, required this.errorFields});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        String? generalError = getBackendErrorsToString(
          'non_field_errors',
          errorFields,
        );
        if (generalError == null) {
          return const SizedBox();
        }
        return ErrorTextWidget(error: generalError);
      },
    );
  }
}
