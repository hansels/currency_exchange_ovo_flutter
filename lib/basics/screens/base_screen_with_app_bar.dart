import 'package:exchange_currency_ovo_flutter/configs/configs.dart';
import 'package:exchange_currency_ovo_flutter/functions/loading_function.dart';
import 'package:exchange_currency_ovo_flutter/widgets/builder/future_use.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

abstract class BaseScreenWithAppBar extends StatefulWidget {
  final bool scrollable;
  final Color backgroundColor;
  final String titleString;
  final EdgeInsets padding;

  // void Function(VoidCallback fn) setState;

  BaseScreenWithAppBar(
    this.titleString, {
    this.scrollable = true,
    this.backgroundColor,
    this.padding = Configs.screenEdgeInsets,
  });

  Future<bool> beforeScaffold(BuildContext context) {
    return Future.value(true);
  }

  Widget appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: title(context),
      backgroundColor: Configs.primaryColor,
      actions: appBarActions(context),
    );
  }

  Widget title(BuildContext context) {
    return Text(titleString, style: const TextStyle(fontSize: 22));
  }

  List<Widget> appBarActions(BuildContext context) {
    return [];
  }

  Widget floatingActionButton(BuildContext context) {
    return null;
  }

  Widget bottomNavigationBar(BuildContext context) {
    return null;
  }

  Widget bottomSheet(BuildContext context) {
    return null;
  }

  Widget drawer(BuildContext context);
  Widget content(BuildContext context);

  @override
  _BaseScreenWithAppBarState createState() => _BaseScreenWithAppBarState();
}

class _BaseScreenWithAppBarState extends State<BaseScreenWithAppBar> {
  @override
  Widget build(BuildContext context) {
    return FutureUse(
      future: widget.beforeScaffold(context),
      widget: LoadingFunction.loadingChasingDots(context),
      builder: (context, snapshot) {
        return KeyboardDismisser(
          child: Scaffold(
            backgroundColor: widget.backgroundColor ?? Colors.white,
            drawer: widget.drawer(context),
            appBar: widget.appBar(context),
            bottomSheet: widget.bottomSheet(context),
            floatingActionButton: widget.floatingActionButton(context),
            bottomNavigationBar: widget.bottomNavigationBar(context),
            body: Padding(
              padding: widget.padding,
              child: _content(context),
            ),
          ),
        );
      },
    );
  }

  Widget _content(BuildContext context) {
    return widget.scrollable
        ? SingleChildScrollView(child: widget.content(context))
        : widget.content(context);
  }
}
