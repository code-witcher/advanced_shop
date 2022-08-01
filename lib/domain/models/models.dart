class SliderObject {
  String title;
  String subtitle;
  String image;

  SliderObject(
    this.title,
    this.subtitle,
    this.image,
  );
}

class SliderViewObject {
  final SliderObject sliderObject;
  final int numOfObjects;
  final int currentIndex;

  SliderViewObject({
    required this.sliderObject,
    required this.numOfObjects,
    required this.currentIndex,
  });
}

/// Login modals
class Customer {
  String id;
  String name;
  int numOfNotifications;

  Customer(this.id, this.name, this.numOfNotifications);
}

class Contacts {
  String phone;
  String email;
  String link;

  Contacts(this.phone, this.email, this.link);
}

class Authentication {
  Customer? customer;
  Contacts? contacts;

  Authentication(this.customer, this.contacts);
}
