import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/layout/news/cubit/cubit.dart';
import 'package:udemy/layout/news/cubit/states.dart';
import 'package:udemy/shared/components/components.dart';

class businessNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsAppCubit, newsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = newsAppCubit.get(context).business;

        return Column(
          children: [
            searchBar(context: context),
            Expanded(child: articleBuilder(list, context)),
          ],
        );
      },
    );
  }
}
