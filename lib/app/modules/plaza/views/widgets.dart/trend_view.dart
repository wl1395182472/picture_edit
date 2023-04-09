import 'package:flutter/material.dart';
import 'package:picture_edit/app/global_widgets/user_avatar.dart';

import '../../../../utils/tools.dart';
import '../../model/trend.dart';

class TrendView extends StatelessWidget {
  final Trend trend;

  const TrendView({
    super.key,
    required this.trend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 20.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: UserAvatar(userId: trend.userId),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                trend.userName,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  trend.text,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              if (trend.imageUrlList.isNotEmpty)
                SizedBox(
                  width: MediaQuery.of(context).size.width - 40.0 - 60.0,
                  child: Wrap(
                    direction: Axis.horizontal,
                    spacing: 5.0,
                    runSpacing: 5.0,
                    children: (trend.imageUrlList.length <= 6
                            ? trend.imageUrlList
                            : trend.imageUrlList.getRange(0, 6))
                        .map(
                          (imageUrl) => GestureDetector(
                            onTap: () => MyTools.seeNetworkPicture(imageUrl),
                            child: Image.network(
                              imageUrl,
                              width: 80.0,
                              height: 80.0,
                              fit: BoxFit.none,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
