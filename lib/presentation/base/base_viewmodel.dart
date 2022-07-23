abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {}

abstract class BaseViewModelInputs {
  /// Will be called to start the viewModel job.
  void start();

  /// Will be called to cancel the viewModel.
  void dispose();
}

abstract class BaseViewModelOutputs {}
