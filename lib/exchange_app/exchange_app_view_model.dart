import 'package:flutter/material.dart';
import 'package:flutter_pr_guide/exchange_app/api/exchange_api.dart';
import 'package:flutter_pr_guide/exchange_app/model/exchange_result.dart';
import 'package:intl/intl.dart';

class ExchangeAppViewModel extends ChangeNotifier {
  final _api = ExchangeApi();

  ExchangeResult? result;

  String get lastUpdateTime {
    if (result == null) {
      return '로딩 안 됨';
    }

    String formattedDate = DateFormat('hh:mm:ss a')
        .format(DateTime.fromMillisecondsSinceEpoch(result!.lastUpdateTime));
    return formattedDate;
  }

  String sourceCode = 'KRW';
  String targetCode = 'USD';

  num? _sourceValue;
  num? _targetValue;

  ExchangeAppViewModel() {
    _api.getExchangeResult(sourceCode).then((value) {
      result = value;
      notifyListeners();
    });
  }

  void setSourceCode(String code) {
    sourceCode = code;
    notifyListeners();

    changeCurrency();
  }

  void setSourceValue(num value, Function(num) callback) {
    _sourceValue = value;
    if (result == null) {
      _targetValue = null;
      notifyListeners();
      return;
    }

    _targetValue = result!.conversionRates[targetCode]! * value;
    if (_targetValue != null) {
      callback(_targetValue!);
    }
    notifyListeners();
  }

  void calculate() {}

  void setTargetCode(String code) {
    targetCode = code;
    notifyListeners();
  }

  void changeCurrency() {
    _api.getExchangeResult(sourceCode).then((value) {
      result = value;
      notifyListeners();
    });
  }
}
