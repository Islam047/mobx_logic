import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../model/post_model.dart';
import '../pages/detail_page.dart';
import '../services/network_service.dart';

part 'detail_store.g.dart';

class DetailStore = _DetailStore with _$DetailStore;

abstract class _DetailStore with Store {

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  @observable bool isLoading = false;

  void init(DetailState state, Post? post) {
    if (state == DetailState.update && post != null) {
      titleController = TextEditingController(text: post.title);
      bodyController = TextEditingController(text: post.body);
    }
  }

  void updatePost(BuildContext context) async {

    String title = titleController.text.trim();
    String body = bodyController.text.trim();
    Post post = Post(
        id: Random().nextInt(100),
        title: title,
        body: body,
        userId: Random().nextInt(100));
    isLoading = true;

    Network.PUT(Network.API_UPDATE, post.toJson()).then((value) {

      Navigator.pop(context, "refresh");
    });

    isLoading = false;

  }

  void addPage(BuildContext context) async {
    String title = titleController.text.trim();
    String body = bodyController.text.trim();
    Post post = Post(
        id: Random().nextInt(100),
        title: title,
        body: body,
        userId: Random().nextInt(100));
    isLoading = true;
    Network.POST(Network.API_UPDATE, post.toJson()).then((value) {

      Navigator.pop(context, "add");
    });
    isLoading = false;

  }

}
