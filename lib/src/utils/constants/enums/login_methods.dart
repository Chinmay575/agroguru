enum LoginType { password, google, unknown }

LoginType? toLoginType(String str) {
  try {
    return LoginType.values.byName(str);
  } catch (e) {
    print("Invalid login type string: $str");
    return null;
  }
}
