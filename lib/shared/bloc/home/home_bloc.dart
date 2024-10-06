import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pingolearn_assignment/shared/repository/data_service.dart';

part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DataService _dataService;

  HomeBloc({required DataService dataService})
      : _dataService = dataService,
        super(HomePageInitial()) {
    on<FetchProduct>(_onFetchProductDetails);
  }

  void _onFetchProductDetails(
      FetchProduct event, Emitter<HomeState> emit) async {
    emit(const ProductLoading());
    try {
      final response = await _dataService.fetchProductData();

      if (response != null) {
        final product = response['products'];
        emit(ProductsFetchSuccess(productData: product));
      } else {
        emit(const ProductsFetchFailure(message: 'Failed to fetch products'));
      }
    } catch (e) {
      emit(const ProductsFetchFailure(message: 'Failed to fetch products'));
    }
  }
}
