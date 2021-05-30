import 'package:exchange_currency_ovo_flutter/functions/toast_helper.dart';
import 'package:exchange_currency_ovo_flutter/models/currency/currency.dart';
import 'package:exchange_currency_ovo_flutter/widgets/currency_card.dart';
import 'package:exchange_currency_ovo_flutter/widgets/custom/custom_text.dart';
import 'package:exchange_currency_ovo_flutter/widgets/normal_form_field.dart';
import 'package:exchange_currency_ovo_flutter/widgets/usual_form_field.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  Map<String, Currency> currencies;

  HomePage({this.currencies});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String newCurrency;
  String temporaryValue;
  double value;
  List<String> ids;

  @override
  void initState() {
    newCurrency = "";
    temporaryValue = "";
    value = 1.0;
    ids = ["IDR", "EUR", "GBP", "SGD"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          "United States Dollar (USD)",
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: NormalFormField(
                suffixIcon: Icon(Icons.attach_money_rounded),
                text: value.toString(),
                onChanged: (val) => temporaryValue = val,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GestureDetector(
                onTap: () => changeValue(double.tryParse(temporaryValue)),
                child: const Icon(Icons.send_rounded, size: 28),
              ),
            )
          ],
        ),
        const SizedBox(height: 25),
        ListView.builder(
          itemBuilder: (context, i) => CurrencyCard(
            value: value,
            currency: widget.currencies[ids[i]],
            deleteCallback: (id) => deleteCallback(id),
          ),
          itemCount: ids.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
        ),
        const SizedBox(height: 25),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: UsualFormField(
                hintText: "Ex: JPY, CHF, THB",
                textCapitalization: TextCapitalization.characters,
                text: newCurrency,
                onChanged: (val) => newCurrency = val,
                labelText: "Add More Currencies",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GestureDetector(
                onTap: () => addCurrency(),
                child: const Icon(Icons.send_rounded, size: 28),
              ),
            )
          ],
        ),
      ],
    );
  }

  void changeValue(double val) {
    if (val == null) return;
    setState(() {
      FocusScope.of(context).unfocus();
      value = val;
    });
  }

  void addCurrency() {
    if (newCurrency == null || newCurrency.isEmpty) return;

    var currency = newCurrency?.toUpperCase();
    var newData = widget.currencies[currency];

    if (newData == null) {
      ToastHelper.showException("ID Currency tidak ditemukan!", context);
    } else {
      ToastHelper.show("Berhasil menambah Currency $currency", context);
      ids.add(currency);
    }
    setState(() => newCurrency = "");
  }

  void deleteCallback(String id) {
    FocusScope.of(context).unfocus();
    setState(() {
      ids.remove(id);
    });
  }
}
