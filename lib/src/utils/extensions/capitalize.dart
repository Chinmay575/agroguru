extension Ext on String {
  String capitalize() {
    String str = this;
    str = str[0].toUpperCase() + str.substring(1);
    return str;
  }
}
