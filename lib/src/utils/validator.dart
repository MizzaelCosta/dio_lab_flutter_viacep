typedef StringFunctionCallback = String? Function(String?)?;

class Validator {
  const Validator._();

  static StringFunctionCallback length({
    required String error,
    required int length,
  }) {
    return (value) {
      if (value == null || value.length != length) {
        return error;
      }
      return null;
    };
  }
}
