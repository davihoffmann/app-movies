String validateRequired(String text, String msg) {
  if (text.isEmpty) {
    return msg;
  }
  return null;
}