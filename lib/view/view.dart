import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../model/post_model.dart';
import '../stores/home_store.dart';

class ItemsEach extends StatelessWidget {
  final HomeStore store;
  final Post post;
  final int index;
  const ItemsEach({Key? key, required this.post, required this.store, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(post),
      startActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              store.goToDetailPageUpdate(post,context);
            },
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            icon: Icons.update,
          ),
        ],
      ),
      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              store.apiPostDelete(post);
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete_outline,
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            Text(
              post.title.toUpperCase(),
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              post.body,
              style: const TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
