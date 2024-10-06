part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomePageInitial extends HomeState {
  const HomePageInitial();
}

class ProductLoading extends HomeState {
  const ProductLoading();
}

class ProductsFetchSuccess extends HomeState {
  final List<dynamic> productData;
  const ProductsFetchSuccess({
    required this.productData,
  });

  @override
  List<Object> get props => [productData];
}

class ProductsFetchFailure extends HomeState {
  final String message;

  const ProductsFetchFailure({required this.message});

  @override
  List<Object> get props => [message];
}
