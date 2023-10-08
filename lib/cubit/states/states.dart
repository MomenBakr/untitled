abstract class NewsStates{}

class NewsInitialStates extends NewsStates{}

class NewsChangeBottomStates extends NewsStates{}

class NewsChangeScreenState extends NewsStates{}

class NewsChangeAppModeState extends NewsStates{}

class NewsSearchLoadingState extends NewsStates{}
class NewsSearchSuccState extends NewsStates{}
class NewsSearchErrorState extends NewsStates{
  late final String error;
  NewsSearchErrorState(this.error);
}





class NewsLoadingBusinessState extends NewsStates{}
class NewsGetBusinessSuccess extends NewsStates{}
class NewsGetBusinessError extends NewsStates{
  late final String error;
  NewsGetBusinessError(this.error);
}


class NewsLoadingSportsState extends NewsStates{}
class NewsGetSportsSuccess extends NewsStates{}
class NewsGetSportsError extends NewsStates{
  late final String error;
  NewsGetSportsError(this.error);
}


class NewsLoadingScienceState extends NewsStates{}
class NewsGetScienceSuccess extends NewsStates{}
class NewsGetScienceError extends NewsStates {
  late final String error;

  NewsGetScienceError(this.error);

}



