extension ConvertString on String {
  String convertAnswer() {
    switch (this) {
      case "0":
        return "a";
      case "1":
        return "b";
      case "2":
        return "c";
      case "3":
        return "d";
      case "4":
        return "e";
      default:
        return "boş";
    }
  }
}
