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

  final _$movieListAtom = Atom(name: 'HomeControllerBase.movieList');

  @override
  List<MovieEntity>? get movieList {
    _$movieListAtom.reportRead();
    return super.movieList;
  }

  @override
  set movieList(List<MovieEntity>? value) {
    _$movieListAtom.reportWrite(value, super.movieList, () {
      super.movieList = value;
    });
  }

  final _$getMovieListAsyncAction =
      AsyncAction('HomeControllerBase.getMovieList');

  @override
  Future<void> setMovieList() {
    return _$getMovieListAsyncAction.run(() => super.setMovieList());
  }

  @override
  String toString() {
    return '''
viewState: ${viewState},
currentPage: ${currentPage},
movieList: ${movieList}
    ''';
  }
}
