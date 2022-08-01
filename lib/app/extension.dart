import 'package:advanced_shop/app/constants.dart';

extension NonNullString on String? {
  String ifEmpty() {
    if (this == null) {
      return Constants.empty;
    }
    return this!;
  }
}

extension NonNullInt on int? {
  int ifZero() {
    if (this == null) {
      return Constants.zero;
    }
    return this!;
  }
}
