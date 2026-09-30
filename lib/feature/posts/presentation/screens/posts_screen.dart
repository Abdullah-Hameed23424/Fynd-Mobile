import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/di/posts_dependencies.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/theme/app_colors.dart';
import 'package:fynd/core/utils/debouncer.dart';
import 'package:fynd/core/widgets/custom_text_field.dart';
import 'package:fynd/feature/posts/domain/entities/post_entity.dart';
import 'package:fynd/feature/posts/domain/params/post_filter.dart';
import 'package:fynd/feature/posts/presentation/cubit/posts_cubit.dart';
import 'package:fynd/feature/posts/presentation/widgets/filter_sheet.dart';
import 'package:fynd/feature/posts/presentation/widgets/posts_section.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  PostFilter _filter = const PostFilter();
  late final TextEditingController _searchController;
  final Debouncer _debouncer = Debouncer(milliseconds: 2000);

  @override
  void initState() {
    _searchController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostsCubit>(
      create: (context) => createPostsCubit()..getPosts(filter: _filter),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: AnimatedItem(
                index: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text('Posts'),
                    SizedBox(height: 4.h),
                    Text(
                      'Find an item faster',
                      style: context.bodyMedium16.copyWith(
                        color: AppColors.textGray,
                      ),
                    ),
                  ],
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size(double.infinity, 50.h),
                child: AnimatedItem(
                  index: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.h,
                    ),
                    child: CustomTextField(
                      controller: _searchController,
                      radius: 14.r,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: AppColors.iconColor,
                      ),
                      hintText: 'Search Title, Description, Location',
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.send,
                      onChanged: (value) {
                        _debouncer.run(() {
                          _filter = _filter.copyWith(
                            search: _searchController.text.trim(),
                          );
                          context.read<PostsCubit>().getPosts(filter: _filter);
                        });
                      },
                      onFieldSubmitted: (value) {
                        _filter = _filter.copyWith(
                          search: _searchController.text.trim(),
                        );
                        context.read<PostsCubit>().getPosts(filter: _filter);
                      },
                    ),
                  ),
                ),
              ),
              toolbarHeight: 100.h,
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    final postsCubit = context.read<PostsCubit>();
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      useSafeArea: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return DraggableScrollableSheet(
                          initialChildSize: 0.65,
                          minChildSize: 0.4,
                          maxChildSize: 0.9,
                          expand: false,
                          builder: (context, scrollController) {
                            return Builder(
                              builder: (context) {
                                return FilterSheet(
                                  filter: _filter,
                                  scrollController: scrollController,
                                  baseCubit: postsCubit,
                                  onChanged: (value) {
                                    _filter = value;
                                  },
                                );
                              },
                            );
                          },
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.filter_list),
                ),
              ],
            ),
            body: SmartRefresher(
              controller: context.read<PostsCubit>().refreshController,
              enablePullDown: true,
              enablePullUp: true,
              onLoading: () {
                final state = context.read<PostsCubit>().state;

                if (state is PostsLoaded) {
                  final currentPage = state.postResponseEntity.page;

                  _filter = _filter.copyWith(page: currentPage + 1);

                  context.read<PostsCubit>().getPosts(filter: _filter);
                }
              },
              onRefresh: () {
                _filter = _filter.copyWith(page: 1);

                context.read<PostsCubit>().getPosts(filter: _filter);
              },

              child: CustomScrollView(
                slivers: <Widget>[
                  // Choosen Filter Section

                  // Post Section
                  PostsSection(
                    onTap: () {
                      _filter = _filter.copyWith(page: 1);

                      context.read<PostsCubit>().getPosts(filter: _filter);
                    },
                    isLoading: (state) => state is PostsLoading,

                    getErrorMessage: (state) =>
                        state is PostsError ? state.msg : null,

                    getPosts: (state) => state is PostsLoaded
                        ? state.postResponseEntity.posts
                        : <PostEntity>[],
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
