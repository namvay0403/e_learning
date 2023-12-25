import 'package:e_learning/detail_teacher/cubit/get_reviews/get_reviews_cubit.dart';
import 'package:e_learning/utilities/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utilities/constants/list_provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class OthersReview extends StatefulWidget {
  const OthersReview({super.key, required this.tutorId});

  final String tutorId;

  @override
  State<OthersReview> createState() => _OthersReviewState();
}

class _OthersReviewState extends State<OthersReview> {
  initState() {
    super.initState();
    context.read<GetReviewsCubit>().getReviews(widget.tutorId);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<GetReviewsCubit, GetReviewsState>(
            builder: (context, state) {
          if (state is GetReviewsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetReviewsSuccess) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.reviews.length,
              itemBuilder: (context, index) {
                final review = state.reviews[index];
                return comment(review.firstInfo.name, review.content,
                    review.createdAt, review.rating, review.firstInfo.avatar);
              },
            );
          } else if (state is GetReviewsFailed) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return const Center(
              child: Text('Failed'),
            );
          }
        }),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Container(
              alignment: Alignment.center,
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: const Text(
                '1',
                style: TextStyle(fontSize: fontSize.large),
              ),
            ),
            const SizedBox(width: 5),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget comment(
      String name, String comment, String time, int rating, String avatar) {
    DateTime createDate = new DateFormat("yyyy-MM-dd").parse(time);
    String createDateString = new DateFormat("dd-MM-yyyy").format(createDate);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(avatar),
            radius: 15,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontFamily: fontApp,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    createDateString,
                    style: TextStyle(
                      fontFamily: fontApp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              RatingBar.builder(
                initialRating: rating.toDouble(),
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 25.0,
                itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              Text(
                comment,
                style: TextStyle(
                  fontFamily: fontApp,
                  fontSize: fontSize.medium,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
