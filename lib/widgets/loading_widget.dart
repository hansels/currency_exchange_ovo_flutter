import 'package:flutter/material.dart';
import 'package:exchange_currency_ovo_flutter/configs/configs.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  final double containerHeight;
  final bool withContainer;

  LoadingWidget({this.containerHeight, this.withContainer = true});

  @override
  Widget build(BuildContext context) {
    return withContainer
        ? Container(height: containerHeight, child: content())
        : content();
  }

  Widget content() {
    return Center(
      child: SpinKitChasingDots(
        color: Configs.primaryColor,
        size: 100.0,
      ),
    );
  }
}
