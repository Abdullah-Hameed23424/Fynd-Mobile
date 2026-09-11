import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/home_cubit.dart';
import '../cubits/home_state.dart';

/// Screen for home

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Add your initialization and initial data here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home'),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HomeErrorState) {
            return Center(child: Text('Error: ${state.message}'));
          }
          if (state is HomeSuccessState) {
            return const Center(child: Text('Success'));
          }
          return const Center(child: Text('Initial'));
        },
      ),
    );
  }
}
