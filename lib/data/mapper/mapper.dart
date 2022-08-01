import 'package:advanced_shop/app/constants.dart';
import 'package:advanced_shop/app/extension.dart';
import 'package:advanced_shop/data/response/responses.dart';
import 'package:advanced_shop/domain/models/models.dart';

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
      this?.phone.ifEmpty() ?? Constants.empty,
      this?.email.ifEmpty() ?? Constants.empty,
      this?.link.ifEmpty() ?? Constants.empty,
    );
  }
}

extension CustomersResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
      this?.id.ifEmpty() ?? Constants.empty,
      this?.name.ifEmpty() ?? Constants.empty,
      this?.numOfNotifications.ifZero() ?? Constants.zero,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.customer.toDomain(),
      this?.contacts.toDomain(),
    );
  }
}
