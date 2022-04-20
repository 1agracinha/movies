// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on HomeControllerBase, Store {
  final _$viewStateAtom = Atom(name: 'HomeControllerBase.viewState');

  @override
  ViewState get viewState {
    _$viewStateAtom.reportRead();
    return super.viewState;
  }

  @override
  set viewState(ViewState value) {
    _$viewStateAtom.reportWrite(value, super.viewState, () {
      super.viewState = value;
    });
  }

  final _$currentPageAtom = Atom(name: 'HomeControllerBase.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$selectedGenreIdAtom =
      Atom(name: 'HomeControllerBase.selectedGenreId');

  @override
  int? get selectedGenreId {
    _$selectedGenreIdAtom.reportRead();
    return super.selectedGenreId;
  }

  @override
  set selectedGenreId(int? value) {
    _$selectedGenreIdAtom.reportWrite(value, super.selectedGenreId, () {
      super.selectedGenreId = value;
    });
  }

  final _$selectedGenreNameAtom =
      Atom(name: 'HomeControllerBase.selectedGenreName');

  @override
  String? get selectedGenreName {
    _$selectedGenreNameAtom.reportRead();
    return super.selectedGenreName;
  }

  @override
  set selectedGenreName(String? value) {
    _$selectedGenreNameAtom.reportWrite(value, super.selectedGenreName, () {
      super.selectedGenreName = value;
    });
  }

  final _$movieListAtom = Atom(name: 'HomeControllerBase.movieList');

  @override
  ObservableList<MovieEntity> get movieList {
    _$movieListAtom.reportRead();
    return super.movieList;
  }

  @override
  set movieList(ObservableList<MovieEntity> value) {
    _$movieListAtom.reportWrite(value, super.movieList, () {
      super.movieList = value;
    });
  }

  final _$currentYearMovieListAtom =
      Atom(name: 'HomeControllerBase.currentYearMovieList');

  @override
  List<MovieEntity>? get currentYearMovieList {
    _$currentYearMovieListAtom.reportRead();
    return super.currentYearMovieList;
  }

  @override
  set currentYearMovieList(List<MovieEntity>? value) {
    _$currentYearMovieListAtom.reportWrite(value, super.currentYearMovieList,
        () {
      super.currentYearMovieList = value;
    });
  }

  final _$genreListAtom = Atom(name: 'HomeControllerBase.genreList');

  @override
  List<GenreEntity>? get genreList {
    _$genreListAtom.reportRead();
    return super.genreList;
  }

  @override
  set genreList(List<GenreEntity>? value) {
    _$genreListAtom.reportWrite(value, super.genreList, () {
      super.genreList = value;
    });
  }

  final _$hasMoreItemsAtom = Atom(name: 'HomeControllerBase.hasMoreItems');

  @override
  bool get hasMoreItems {
    _$hasMoreItemsAtom.reportRead();
    return super.hasMoreItems;
  }

  @override
  set hasMoreItems(bool value) {
    _$hasMoreItemsAtom.reportWrite(value, super.hasMoreItems, () {
      super.hasMoreItems = value;
    });
  }

  final _$scrolledAtom = Atom(name: 'HomeControllerBase.scrolled');

  @override
  bool get scrolled {
    _$scrolledAtom.reportRead();
    return super.scrolled;
  }

  @override
  set scrolled(bool value) {
    _$scrolledAtom.reportWrite(value, super.scrolled, () {
      super.scrolled = value;
    });
  }

  final _$pageAtom = Atom(name: 'HomeControllerBase.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$setMovieListAsyncAction =
      AsyncAction('HomeControllerBase.setMovieList');

  @override
  Future<void> setMovieList() {
    return _$setMovieListAsyncAction.run(() => super.setMovieList());
  }

  final _$setGenreListAsyncAction =
      AsyncAction('HomeControllerBase.setGenreList');

  @override
  Future<void> setGenreList() {
    return _$setGenreListAsyncAction.run(() => super.setGenreList());
  }

  final _$loadHomePageDataAsyncAction =
      AsyncAction('HomeControllerBase.loadHomePageData');

  @override
  Future<void> loadHomePageData() {
    return _$loadHomePageDataAsyncAction.run(() => super.loadHomePageData());
  }

  final _$updateGenreMovieListAsyncAction =
      AsyncAction('HomeControllerBase.updateGenreMovieList');

  @override
  Future<void> updateGenreMovieList(GenreEntity genreEntity) {
    return _$updateGenreMovieListAsyncAction
        .run(() => super.updateGenreMovieList(genreEntity));
  }

  final _$setMoviesByGenreAndReleaseYearAsyncAction =
      AsyncAction('HomeControllerBase.setMoviesByGenreAndReleaseYear');

  @override
  Future<void> setMoviesByGenreAndReleaseYear() {
    return _$setMoviesByGenreAndReleaseYearAsyncAction
        .run(() => super.setMoviesByGenreAndReleaseYear());
  }

  final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase');

  @override
  void updateOnScroll(ScrollController scrollController) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.updateOnScroll');
    try {
      return super.updateOnScroll(scrollController);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
viewState: ${viewState},
currentPage: ${currentPage},
selectedGenreId: ${selectedGenreId},
selectedGenreName: ${selectedGenreName},
movieList: ${movieList},
currentYearMovieList: ${currentYearMovieList},
genreList: ${genreList},
hasMoreItems: ${hasMoreItems},
scrolled: ${scrolled},
page: ${page}
    ''';
  }
}
