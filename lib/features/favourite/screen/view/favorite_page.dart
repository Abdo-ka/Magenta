// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magenta/config/common/enum/enums.dart';
import 'package:magenta/core/di/di_container.dart';
import 'package:magenta/features/favourite/controller/favorite_bloc/favorite_bloc.dart';
import 'package:magenta/features/favourite/screen/widget/no_favourite.dart';
import 'package:magenta/features/home/screen/view/home_page_loading.dart';

// 🌎 Project imports:
import 'package:magenta/features/home/screen/widget/item_card_widget.dart';

// 🌎 Project imports:

@RoutePage()
class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final bloc = getIt<FavoriteBloc>();
  @override
  void initState() {
    bloc.add(GetFavouriteEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          'My Favourite',
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            if (state.FavouriteStatus == Status.loading) {
              return const HomePageLoading();
            } else {
              if (state.favouriteModel.favorites?.data?.length == 0) {
                return NoFavouriteWidget();
              } else {
                return ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    AppText(
                      'this is the list of your imgainaiation choices:',
                      style: context.textTheme.labelSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio:
                              context.width / context.height / .75),
                      itemBuilder: (context, index) => ItemCardWidget(
                        categoryName:
                            state.favouriteModel.favorites?.data?[index].name ??
                                "",
                        name:
                            state.favouriteModel.favorites?.data?[index].name ??
                                "",
                        price: state
                                .favouriteModel.favorites?.data?[index].price ??
                            "",
                        image: state.favouriteModel.favorites?.data?[index]
                                .media?[0].originalUrl ??
                            '',
                        id: state.favouriteModel.favorites?.data?[index].id ??
                            0,
                        onTap: () {},
                      ),
                      itemCount:
                          state.favouriteModel.favorites?.data?.length ?? 0,
                    ),
                    60.verticalSpace,
                  ],
                );
              }
            }
          },
        ),
      ),
    );
  }
}
