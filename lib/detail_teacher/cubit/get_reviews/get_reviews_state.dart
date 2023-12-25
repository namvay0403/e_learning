part of 'get_reviews_cubit.dart';

@immutable
abstract class GetReviewsState {}

class GetReviewsInitial extends GetReviewsState {}

class GetReviewsLoading extends GetReviewsState {}

class GetReviewsSuccess extends GetReviewsState {
  final List<Review> reviews;

  GetReviewsSuccess(this.reviews);
}

class GetReviewsFailed extends GetReviewsState {
  final String error;

  GetReviewsFailed(this.error);
}
