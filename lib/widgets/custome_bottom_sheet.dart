import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/near_by_places_model/result.dart';
import 'package:flutter_application_2/widgets/customRate.dart';

class BuildItemBottomsheet extends StatelessWidget {
  Result places;
  BuildItemBottomsheet({
    required this.places,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 12,
      child: Column(
        children: [
          Row(
            children: [
              Image(
                width: MediaQuery.sizeOf(context).width / 8,
                height: MediaQuery.sizeOf(context).height / 20,
                fit: BoxFit.cover,
                image: NetworkImage(places.icon!),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width / 1.5,
                    child: Text(
                      '${places.name} ',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Text(
                'Rating of this place ',
                style: TextStyle(color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: CustomRateWidget(
                  initalRating: places.rating!.toDouble(),
                  onRatingUpdate: (rate) {
                    //TODO update rating
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
