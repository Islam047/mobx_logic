import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../model/post_model.dart';
import '../pages/detail_page.dart';
import '../services/network_service.dart';

part 'home_store.g.dart';


class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable  List<Post> items = [];
  @observable  List<Post> myItems = [];
  @observable bool isLoading = false;

  Future<void> apiPostList() async {
    isLoading = true;

    String? response =
    await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      items = Network.parsePostList(response);
    } else {
      items = [];
    }
    myItems = items;
    isLoading = false;
  }

  Future<bool> apiPostDelete(Post post) async {
    isLoading = true;
    String? response = await Network.DEL(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    isLoading = false;

    return response != null;
  }

  void goToDetailPage(BuildContext context) async {

    await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const DetailPage(
        state: DetailState.create,
      );
    }));


  }

  void goToDetailPageUpdate(Post post,BuildContext context) async {

    await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return DetailPage(
        post: post,
        state: DetailState.update,
      );
    }));


  }
}
