import 'package:exchange_currency_ovo_flutter/basics/helpers/base_http_helper.dart';
import 'package:exchange_currency_ovo_flutter/models/currency/currency.dart';

class CurrencyHelper extends BaseHTTPHelper {
  Future<Map<String, Currency>> currencies() async {
    Map<String, dynamic> data = await get(endpoint: "currencies");

    Map<String, Currency> result = {};
    for (var key in data.keys) {
      Currency currency = Currency.fromMap(data[key] as Map<String, dynamic>);
      result[key] = currency;
    }

    return result;
  }
}
