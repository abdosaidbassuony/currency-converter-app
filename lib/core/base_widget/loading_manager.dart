import 'package:flutter/material.dart';
import 'package:currencyconverterapp/core/utils/resources/color_scheme.dart';

mixin LoadingManager {
  void runChangeState();

  bool isLoading = false;
  bool isLoadingWithMessage = false;

  void showLoading() async {
    if (!isLoading) {
      isLoading = true;
      runChangeState();
    }
  }

  void hideLoading() async {
    if (isLoading) {
      isLoading = false;
      runChangeState();
    }
  }

  Widget loadingManagerWidget() {
    if (isLoading) {
      return customLoadingWidget();
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget customLoadingWidget() {
    return const InkWell(
      onTap: null,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
            child: CircularProgressIndicator(
          color: ColorsScheme.primaryColor,
        )),
      ),
    );
  }
}
