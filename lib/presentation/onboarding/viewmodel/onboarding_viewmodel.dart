import 'dart:async';

import 'package:advanced_shop/domain/models.dart';

import '../../base/base_viewmodel.dart';
import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';

class OnboardingViewModel extends BaseViewModel
    with OnboardingViewModelInputs, OnboardingViewModelOutputs {
  /// Stream Controller
  final StreamController _streamController =
      StreamController<SliderViewObject>();

  late final List<SliderObject> _list;

  int currentIndex = 0;

  /// Onboarding ViewModel Inputs
  @override
  void start() {
    _list = getSliderObject();
    _postDataToView();
  }

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  int getNext() {
    if (currentIndex < _list.length - 1) {
      return ++currentIndex;
    } else {
      return 0;
    }
  }

  @override
  int getPrevious() {
    if (currentIndex > 0) {
      return --currentIndex;
    } else {
      return _list.length - 1;
    }
  }

  @override
  void onPageChange(int index) {
    currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  /// Onboarding ViewModel Outputs.
  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map(
        (event) => event,
      );

  /// ViewModel private methods.
  void _postDataToView() {
    _streamController.add(
      SliderViewObject(
        sliderObject: _list[currentIndex],
        numOfObjects: _list.length,
        currentIndex: currentIndex,
      ),
    );
  }

  List<SliderObject> getSliderObject() {
    return [
      SliderObject(
        AppStrings.onBoardingTitle1,
        AppStrings.onBoardingSubtitle1,
        ImageAssets.onBoardingLogo1,
      ),
      SliderObject(
        AppStrings.onBoardingTitle2,
        AppStrings.onBoardingSubtitle2,
        ImageAssets.onBoardingLogo2,
      ),
      SliderObject(
        AppStrings.onBoardingTitle3,
        AppStrings.onBoardingSubtitle3,
        ImageAssets.onBoardingLogo3,
      ),
      SliderObject(
        AppStrings.onBoardingTitle4,
        AppStrings.onBoardingSubtitle4,
        ImageAssets.onBoardingLogo4,
      ),
    ];
  }
}

/// Inputs mean "Orders" that our ViewModel will receive from the View.
abstract class OnboardingViewModelInputs {
  // To get the next page when the user click on right arrow or swipe left.
  int getNext();

  // To get the previous page when the user click on left arrow or swipe right.
  int getPrevious();

  // When the user swipe left or right to get next or previous page.
  void onPageChange(int index);

  // The input for the stream controller.
  Sink get inputSliderViewObject;
}

abstract class OnboardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}
