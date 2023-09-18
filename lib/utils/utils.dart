/// To Check Text is Empty or Null
bool isNotNullEmptyString(String? value) {
  if (value == null ||
      value.isEmpty ||
      value.toLowerCase() == "null".toLowerCase() ||
      value.trim().isEmpty) {
    return false;
  } else {
    return true;
  }
}
