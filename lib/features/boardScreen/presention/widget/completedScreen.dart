import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_algoriza/util/Bloc/cubit.dart';
import 'package:todo_algoriza/util/Bloc/states.dart';
import 'package:todo_algoriza/util/widgets/customButton.dart';
import 'package:todo_algoriza/util/widgets/myDivider.dart';

import '../../../../util/widgets/BuildTask.dart';
import '../../../../util/widgets/emptyScreen.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc,AppStates>(
        listener: (BuildContext context,AppStates state){},
        builder: (BuildContext context,AppStates state) {
          AppBloc cubit =AppBloc.get(context);
          var Tasks= cubit.CompletedTasks;

          return  AppBloc.get(context).CompletedTasks.isEmpty
              ? Expanded(
            child:EmptyScreen(),
          )
              : Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                AppBloc.get(context).GetDataFromDataBase();
              },
              child: ListView.builder(
                  itemBuilder: (context, index) => BuildTask(
                      item: AppBloc.get(context).CompletedTasks[index],color: cubit.colorslist[index % cubit.colorslist.length],),
                  itemCount: AppBloc.get(context).CompletedTasks.length),
            ),
          );

        });
  }
}
