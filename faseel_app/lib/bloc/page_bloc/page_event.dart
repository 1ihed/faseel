part of 'page_bloc.dart';

abstract class PageEvent {}

final class PageCurrentEvent extends PageEvent {
  final int currentPage;

  PageCurrentEvent(this.currentPage);
}
