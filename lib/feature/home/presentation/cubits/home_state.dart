/// States for HomeCubit

abstract class HomeState {
  const HomeState();
}

class HomeInitialState extends HomeState {
  const HomeInitialState();
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState();
}

class HomeSuccessState extends HomeState {
  const HomeSuccessState();
}

class HomeErrorState extends HomeState {
  final String message;

  const HomeErrorState({required this.message});
}
