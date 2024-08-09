// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState extends Equatable {
  final Status offerStatus;
  final Status popularStatus;
  final Status categoryStatus;
  final ProductsModel products;
  final CategoryModel category;
  const HomeState({
    this.offerStatus = Status.initial,
    this.popularStatus = Status.initial,
    this.categoryStatus = Status.initial,
    this.products = const ProductsModel(),
    this.category = const CategoryModel(),
  });

  @override
  List<Object> get props => [
        offerStatus,
        popularStatus,
        categoryStatus,
        products,
        category,
      ];

  HomeState copyWith({
    Status? offerStatus,
    Status? popularStatus,
    Status? categoryStatus,
    ProductsModel? products,
    CategoryModel? category,
  }) {
    return HomeState(
      offerStatus: offerStatus ?? this.offerStatus,
      popularStatus: popularStatus ?? this.popularStatus,
      categoryStatus: categoryStatus ?? this.categoryStatus,
      products: products ?? this.products,
      category: category ?? this.category,
    );
  }
}
