import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../stores/home_store.dart';
import '../view/view.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeStore store = HomeStore();

  @override
  void initState() {
    super.initState();
    store.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Observer(
        builder: (context) {
          return Stack(
            children: [
              ListView.builder(
                  itemCount: store.myItems.length,
                  itemBuilder: (context, index) {
                    return ItemsEach(
                      post: store.myItems[index],
                      store: store, index: index,
                    );
                  }),
              Visibility(
                visible: store.isLoading,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                ),
              )
            ],
          );
        },
      ),
      floatingActionButton: Observer(
        builder: (context) {
          return FloatingActionButton(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            onPressed: () {
              store.goToDetailPage(context);
            },
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}
