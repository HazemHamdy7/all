 
import 'package:all/model/dress_code.dart';

class DressCodeState {
  final int currentIndex;
  final List<DressCode> options;

  const DressCodeState({
    required this.currentIndex,
    required this.options,
  });

  factory DressCodeState.initial(List<DressCode> options) {
    return DressCodeState(currentIndex: 0, options: options);
  }

  DressCodeState copyWith({int? currentIndex}) {
    return DressCodeState(
      currentIndex: currentIndex ?? this.currentIndex,
      options: options, // options remain unchanged
    );
  }
}
