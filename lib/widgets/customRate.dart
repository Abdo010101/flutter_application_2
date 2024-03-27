import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRateWidget extends StatelessWidget {
  EdgeInsetsGeometry? padding;
  double? initalRating;
  double? itemSize;
  void Function(double) onRatingUpdate;
  CustomRateWidget(
      {super.key,
      this.padding,
      this.itemSize,
      this.initalRating,
      required this.onRatingUpdate});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initalRating ?? 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: itemSize ?? 20,
      itemPadding: padding ?? EdgeInsets.zero,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: onRatingUpdate,
    );
  }
}
