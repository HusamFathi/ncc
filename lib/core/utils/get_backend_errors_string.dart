import '../extensions/string.dart';

String? getBackendErrorsToString(
  String text,
  Map<String, List<String>> mapData,
) {
  // If the map contains the text as a key

  try {
    if (mapData.containsKey(text)) {
      // Get the list of strings associated with the key
      final list = mapData[text] ?? [];
      // If the list is not empty
      if (list.isNotEmpty) {
        // Join the list elements with newlines and return the result
        return list.join('\n').capitalizeFirstLetter();
      }
    }
  } catch (error) {
    return null;
  }
  return null;
}
