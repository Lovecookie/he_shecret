import 'package:shipcret/providers/entitys/entity_base.dart';

import 'package:fixnum/fixnum.dart';

// ignore: must_be_immutable
class FFeedSummaryEntity extends FEntityBase {
  final Int64 useruuid;
  final Int64 feeduuid;
  final String summaryPictureUrl;

  const FFeedSummaryEntity({
    this.useruuid = Int64.ZERO,
    this.feeduuid = Int64.ZERO,
    this.summaryPictureUrl = '',
  });

  @override
  List<Object?> get props => [
        useruuid,
        feeduuid,
        summaryPictureUrl,
      ];

  @override
  FRequestJson toJson() {
    return {
      'useruuid': useruuid.toString(),
      'feeduuid': feeduuid.toString(),
      'summaryPictureUrl': summaryPictureUrl,
    };
  }
}
