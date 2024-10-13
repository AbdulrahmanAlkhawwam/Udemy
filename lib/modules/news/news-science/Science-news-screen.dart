import 'package:udemy/shared/components/components.dart';
import 'package:udemy/layout/news/cubit/states.dart';
import 'package:udemy/layout/news/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class scienceNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsAppCubit, newsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = newsAppCubit.get(context).science;

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
