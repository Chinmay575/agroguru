enum LoginType { email, google, phone }

LoginType? toLoginType(String str) {
  try {
    return LoginType.values.byName(str);
  } catch (e) {
    print("Invalid login type string: $str");
    return null;
  }
}
