import 'package:flutter_bloc/flutter_bloc.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(PageInitial()) {
    on<PageCurrentEvent>((event, emit) {
      emit(PageCurrentState(event.currentPage));
    });
  }
}
