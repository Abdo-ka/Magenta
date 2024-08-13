// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState extends Equatable {
  final Status offerStatus;
  final Status popularStatus;
  final Status categoryStatus;
  final Status signalProductsStatus;
  final ProductsModel products;
  final CategoryModel category;
  final OfferModel offerModel;
  final SignleProductModel signalProduct;
  final List<int> Favourite;
  const HomeState({
    this.offerStatus = Status.initial,
    this.popularStatus = Status.initial,
    this.categoryStatus = Status.initial,
    this.signalProductsStatus = Status.initial,
    this.products = const ProductsModel(),
    this.category = const CategoryModel(),
    this.offerModel = const OfferModel(),
    this.Favourite = const [],
    this.signalProduct = const SignleProductModel.SignleProductModel(),
  });

  @override
  List<Object> get props => [
        offerStatus,
        popularStatus,
        categoryStatus,
        products,
        category,
        signalProduct,
        signalProductsStatus,
        Favourite,
        offerModel,
      ];

  HomeState copyWith({
    Status? offerStatus,
    Status? popularStatus,
    Status? categoryStatus,
    Status? signalProductsStatus,
    ProductsModel? products,
    CategoryModel? category,
    OfferModel ? offerModel,
    SignleProductModel? signalProduct,
    List<int>? Favourite,
  }) {
    return HomeState(
      offerStatus: offerStatus ?? this.offerStatus,
      popularStatus: popularStatus ?? this.popularStatus,
      categoryStatus: categoryStatus ?? this.categoryStatus,
      signalProductsStatus: signalProductsStatus ?? this.signalProductsStatus,
      products: products ?? this.products,
      category: category ?? this.category,
      offerModel:  offerModel??this.offerModel,
      signalProduct: signalProduct ?? this.signalProduct,
      Favourite: Favourite ?? this.Favourite,
    );
  }
}
