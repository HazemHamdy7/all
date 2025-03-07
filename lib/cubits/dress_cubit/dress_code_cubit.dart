import 'package:all/constants/assets.dart';
import 'package:all/model/dress_code.dart';
import 'package:bloc/bloc.dart';

import 'dress_code_state.dart';

class DressCodeCubit extends Cubit<DressCodeState> {
  DressCodeCubit() : super(DressCodeState.initial(_defaultOptions));

  // Default list of dress code options.
  static final List<DressCode> _defaultOptions = [
    DressCode(
      name: 'Tactical Casual',
      image: Assets.imageBoudGuard1,
      description: 'Protectors tailor their uniform for any occasion.',
    ),
    DressCode(
      name: 'Business Casual',
      image: Assets.imageBodyGurd4,
      description: 'Protectors tailor their uniform for any occasion.',
    ),
    DressCode(
      name: 'Formal',
      image: Assets.imageBodyGurd6,
      description: 'Protectors tailor their uniform for any occasion.',
    ),
  ];

  /// Update the current index when the user navigates.
  void updatePage(int newPage) {
    emit(state.copyWith(currentIndex: newPage));
  }
}
