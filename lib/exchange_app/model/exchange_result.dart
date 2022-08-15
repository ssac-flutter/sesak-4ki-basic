import 'package:json_annotation/json_annotation.dart';

part 'exchange_result.g.dart';

@JsonSerializable()
class ExchangeResult {
  @JsonKey(name: 'time_last_update_unix')
  final int lastUpdateTime;

  @JsonKey(name: 'base_code')
  final String baseCode;

  @JsonKey(name: 'conversion_rates')
  final Map<String, num> conversionRates;

  ExchangeResult(
    this.lastUpdateTime,
    this.baseCode,
    this.conversionRates,
  );

  factory ExchangeResult.fromJson(Map<String, dynamic> json) =>
      _$ExchangeResultFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangeResultToJson(this);
}
