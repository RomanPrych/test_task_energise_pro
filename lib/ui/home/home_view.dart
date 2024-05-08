import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_energise_pro/ui/functional_page/functional_module.dart';
import 'package:test_task_energise_pro/ui/home/home_controller.dart';
import 'package:test_task_energise_pro/ui/home/home_state.dart';
import 'package:test_task_energise_pro/ui/map_page/map_module.dart';
import 'package:test_task_energise_pro/ui/play_page/play_module.dart';
import 'package:test_task_energise_pro/ui/widgets/app_bar_change_language.dart';
import 'package:test_task_energise_pro/ui/widgets/loading_widget.dart';
import 'package:transitioned_indexed_stack/transitioned_indexed_stack.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _screens = [
    const PlayModule(),
    const MapModule(),
    const FunctionalModule(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeController, HomeState>(
      buildWhen: (_, __) {
        if (__ is LoadingHomeState || __ is HomeStateData) {
          return true;
        } else {
          return false;
        }
      },
      builder: (BuildContext context, state) {
        if (state is HomeStateData) {
          return Scaffold(
            appBar: AppBarChangeLanguage(callBack: (_)=>print(_.value),),
            body: FadeIndexedStack(
              curve: Curves.bounceInOut,
              duration: const Duration(seconds: 3),
              index: state.homeModelData.indexPage ?? 0,
              children: _screens,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.homeModelData.indexPage ?? 0,
              onTap: (index) {context.read<HomeController>().changeIndex(index);},
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Screen 1',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Screen 2',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Screen 3',
                ),
              ],
            ),
          );
        } else {
          return const LoadingWidget();
        }
      },
      listener: (BuildContext context, Object? state) {
    if (state is HomeStateData) {
      print(state.homeModelData.indexPage);
    }
      },
    );
  }
}
