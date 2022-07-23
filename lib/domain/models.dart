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
