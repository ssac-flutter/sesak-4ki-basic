import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pr_guide/exchange_app/exchange_app_view_model.dart';
import 'package:provider/provider.dart';

class ExchangeAppScreen extends StatefulWidget {
  const ExchangeAppScreen({Key? key}) : super(key: key);

  @override
  State<ExchangeAppScreen> createState() => _ExchangeAppScreenState();
}

class _ExchangeAppScreenState extends State<ExchangeAppScreen> {
  final _sourceTextController = TextEditingController();
  final _targetTextController = TextEditingController();

  @override
  void dispose() {
    _sourceTextController.dispose();
    _targetTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ExchangeAppViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('환율 계산기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.grey,
              child: Text(viewModel.lastUpdateTime),
            ),
            Row(
              children: [
                DropdownButton<String>(
                  value: viewModel.sourceCode,
                  items: codes.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    if (newValue != null) {
                      viewModel.setSourceCode(newValue);
                    }
                  },
                ),
                Expanded(
                  child: TextField(
                    enabled: viewModel.result != null,
                    keyboardType: TextInputType.number,
                    controller: _sourceTextController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '',
                    ),
                    onChanged: (value) {
                      viewModel.setSourceValue(int.tryParse(value) ?? 1,
                          (targetValue) {
                        _targetTextController.text = '$targetValue';
                      });
                    },
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_circle_down_sharp,
                size: 40,
              ),
            ),
            Row(
              children: [
                DropdownButton<String>(
                  value: viewModel.targetCode,
                  items: codes.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    if (newValue != null) {
                      viewModel.setTargetCode(newValue);
                    }
                  },
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _targetTextController,
                    enabled: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

const codes = [
  "USD",
  "AED",
  "AFN",
  "ALL",
  "AMD",
  "ANG",
  "AOA",
  "ARS",
  "AUD",
  "AWG",
  "AZN",
  "BAM",
  "BBD",
  "BDT",
  "BGN",
  "BHD",
  "BIF",
  "BMD",
  "BND",
  "BOB",
  "BRL",
  "BSD",
  "BTN",
  "BWP",
  "BYN",
  "BZD",
  "CAD",
  "CDF",
  "CHF",
  "CLP",
  "CNY",
  "COP",
  "CRC",
  "CUP",
  "CVE",
  "CZK",
  "DJF",
  "DKK",
  "DOP",
  "DZD",
  "EGP",
  "ERN",
  "ETB",
  "EUR",
  "FJD",
  "FKP",
  "FOK",
  "GBP",
  "GEL",
  "GGP",
  "GHS",
  "GIP",
  "GMD",
  "GNF",
  "GTQ",
  "GYD",
  "HKD",
  "HNL",
  "HRK",
  "HTG",
  "HUF",
  "IDR",
  "ILS",
  "IMP",
  "INR",
  "IQD",
  "IRR",
  "ISK",
  "JEP",
  "JMD",
  "JOD",
  "JPY",
  "KES",
  "KGS",
  "KHR",
  "KID",
  "KMF",
  "KRW",
  "KWD",
  "KYD",
  "KZT",
  "LAK",
  "LBP",
  "LKR",
  "LRD",
  "LSL",
  "LYD",
  "MAD",
  "MDL",
  "MGA",
  "MKD",
  "MMK",
  "MNT",
  "MOP",
  "MRU",
  "MUR",
  "MVR",
  "MWK",
  "MXN",
  "MYR",
  "MZN",
  "NAD",
  "NGN",
  "NIO",
  "NOK",
  "NPR",
  "NZD",
  "OMR",
  "PAB",
  "PEN",
  "PGK",
  "PHP",
  "PKR",
  "PLN",
  "PYG",
  "QAR",
  "RON",
  "RSD",
  "RUB",
  "RWF",
  "SAR",
  "SBD",
  "SCR",
  "SDG",
  "SEK",
  "SGD",
  "SHP",
  "SLE",
  "SLL",
  "SOS",
  "SRD",
  "SSP",
  "STN",
  "SYP",
  "SZL",
  "THB",
  "TJS",
  "TMT",
  "TND",
  "TOP",
  "TRY",
  "TTD",
  "TVD",
  "TWD",
  "TZS",
  "UAH",
  "UGX",
  "UYU",
  "UZS",
  "VES",
  "VND",
  "VUV",
  "WST",
  "XAF",
  "XCD",
  "XDR",
  "XOF",
  "XPF",
  "YER",
  "ZAR",
  "ZMW",
  "ZWL",
];
