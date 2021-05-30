import 'package:exchange_currency_ovo_flutter/models/currency/currency.dart';
import 'package:exchange_currency_ovo_flutter/models/currency/currency_helper.dart';
import 'package:flutter/material.dart';

import 'package:exchange_currency_ovo_flutter/basics/screens/base_screen_with_app_bar.dart';
import 'package:exchange_currency_ovo_flutter/screens/home/home_page.dart';

class HomeScreen extends BaseScreenWithAppBar {
  Map<String, Currency> currencies;

  HomeScreen() : super("EX-Currency");

  @override
  Widget content(BuildContext context) {
    return HomePage(currencies: currencies);
  }

  @override
  Widget drawer(BuildContext context) {
    return null;
  }

  @override
  Future<bool> beforeScaffold(BuildContext context) async {
    currencies = await CurrencyHelper().currencies();
    return true;
  }
}
