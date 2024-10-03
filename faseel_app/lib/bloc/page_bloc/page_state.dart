part of 'page_bloc.dart';

abstract class PageState {}

final class PageInitial extends PageState {}

final class PageCurrentState extends PageState {
  final int currentPage;

  PageCurrentState(this.currentPage);
}
