import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/review_model.dart';
import '../../repo/review_repo.dart';

part 'get_reviews_state.dart';

class GetReviewsCubit extends Cubit<GetReviewsState> {
  GetReviewsCubit() : super(GetReviewsInitial());

  Future<void> getReviews(String tutorId) async {
    emit(GetReviewsLoading());
    try {
      List<Review> reviews = await ReviewRepo().getReviews(tutorId);
      emit(GetReviewsSuccess(reviews));
    } catch (e) {
      emit(GetReviewsFailed(e.toString()));
    }
  }
}
