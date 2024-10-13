import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/layout/news/cubit/cubit.dart';
import 'package:udemy/layout/news/cubit/states.dart';
import 'package:udemy/shared/components/components.dart';
import 'package:udemy/shared/network/local/cache-helper.dart';

class searchNewsScreen extends StatelessWidget {
  var SearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsAppCubit, newsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var List = newsAppCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_outlined,
                color: CacheHelper.getBoolean(key: 'isDark')!
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            title: Text('search'),
            actions: [
              IconButton(
                onPressed: () => newsAppCubit.get(context).changeTS(),
                icon: Icon(Icons.brightness_4_outlined),
              ),
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: SearchController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      color: CacheHelper.getBoolean(key: 'isDark')!
                          ? Colors.white
                          : Colors.grey[600],
                    ),
                    label: Text(
                      'Search',
                      style: TextStyle(
                        color: CacheHelper.getBoolean(key: 'isDark')!
                            ? Colors.white
                            : Colors.grey[600],
                      ),
                    ),
                  ),
                  onChanged: (dynamic value) {
                    print(value);
                    newsAppCubit.get(context).getSearch(value);
                  },
                ),
              ),
              List.isEmpty
                  ? Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.report_gmailerrorred_outlined,
                              color: Colors.grey,
                              size: 100.0,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "sorry , we con't found\n\t\t\t\t\t\t\t\t your search",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.0),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Expanded(child: articleBuilder(List, context)),
            ],
          ),
        );
      },
    );
  }
}
