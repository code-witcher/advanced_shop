import 'package:advanced_shop/presentation/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:advanced_shop/presentation/resources/assets_manager.dart';
import 'package:advanced_shop/presentation/resources/color_manager.dart';
import 'package:advanced_shop/presentation/resources/routes_manager.dart';
import 'package:advanced_shop/presentation/resources/strings_manager.dart';
import 'package:advanced_shop/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../domain/models/models.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _controller = PageController();
  final OnboardingViewModel _viewModel = OnboardingViewModel();

  void _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (ctx, snapshot) => _getContentWidget(snapshot.data),
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return const Scaffold();
    }

    return Scaffold(
      appBar: AppBar(
        elevation: AppSize.s0,
        backgroundColor: ColorManager.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      backgroundColor: ColorManager.white,
      body: PageView.builder(
        controller: _controller,
        itemCount: sliderViewObject.numOfObjects,
        onPageChanged: _viewModel.onPageChange,
        itemBuilder: (ctx, index) => OnBoardingPage(
          sliderObject: sliderViewObject.sliderObject,
        ),
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
                },
                child: Text(
                  AppStrings.skip,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            _getIndicator(sliderViewObject),
          ],
        ),
      ),
    );
  }

  Widget _getIndicator(SliderViewObject sliderViewObject) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              onTap: () {
                _controller.animateToPage(
                  _viewModel.getPrevious(),
                  duration: const Duration(
                    milliseconds: AppConstants.animationDuration,
                  ),
                  curve: Curves.easeInOut,
                );
              },
              child: const SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: ColorManager.white,
                ),
              ),
            ),
          ),

          /// Circle Indicators.
          Row(
            children: [
              for (int i = 0; i < sliderViewObject.numOfObjects; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i, sliderViewObject.currentIndex),
                ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              onTap: () {
                _controller.animateToPage(
                  _viewModel.getNext(),
                  duration: const Duration(
                    milliseconds: AppConstants.animationDuration,
                  ),
                  curve: Curves.easeInOut,
                );
              },
              child: const SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorManager.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getProperCircle(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCircleIc);
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc);
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject sliderObject;
  const OnBoardingPage({Key? key, required this.sliderObject})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(sliderObject.image),
      ],
    );
  }
}
