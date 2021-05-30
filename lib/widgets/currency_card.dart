import 'package:exchange_currency_ovo_flutter/models/currency/currency.dart';
import 'package:exchange_currency_ovo_flutter/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';

class CurrencyCard extends StatefulWidget {
  final double value;
  final Currency currency;
  final Function(String) deleteCallback;

  CurrencyCard({this.value, this.currency, this.deleteCallback});

  @override
  _CurrencyCardState createState() => _CurrencyCardState();
}

class _CurrencyCardState extends State<CurrencyCard> {
  @override
  Widget build(BuildContext context) {
    var currency = widget.currency;
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
      minVerticalPadding: 8,
      trailing: IconButton(
        icon: Icon(Icons.delete, color: Colors.red),
        onPressed: () => widget.deleteCallback(currency.id),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(currency.id, fontSize: 24),
              CustomText(
                currencyValue?.toString() ?? "0.0",
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          CustomText(currency.name, fontSize: 18, italic: true),
          CustomText(
            "1 USD = " + currency.id + " " + currency.value?.toString(),
            fontSize: 14,
          ),
        ],
      ),
    );
  }

  double get currencyValue => widget.value * widget.currency.value;
}
