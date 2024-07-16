import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/common_drawer.dart';
import 'package:flutter_application_2/daos/todo_dao.dart';
import 'package:provider/provider.dart';

class CountTodoDemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: CommonDrawer.getDrawer(context),
      //請context讀取TodoDao並調度此共享狀態的getTodos函數，取得todoList，並測量數據、轉為字串貼回
      body: Container(
        child: Text("目前的Todo數量為 " + context.read<TodoDao>().getTodos().length.toString()),
      ),
    );
  }
}