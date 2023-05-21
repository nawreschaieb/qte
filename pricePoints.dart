// ignore_for_file: unused_import

import 'package:collection/collection.dart';

class PricePoint {
  final double x;
  final double y;
  PricePoint({required this.x, required this.y});
}

List<PricePoint> get pricePoints {
  final data = <double>[1.2, 0.7, 3.59, 4.6, 2.22, 3.48, 1.25];
  return data
      .mapIndexed(
          ((index, element) => PricePoint(x: index.toDouble(), y: element)))
      .toList();
}
