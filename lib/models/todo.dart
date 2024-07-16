import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Todo {
  //用來確認任務是否完成
  bool isComplete;
  //任務內容文字
  String content;
  //建構子
  Todo(this.isComplete, this.content);
}