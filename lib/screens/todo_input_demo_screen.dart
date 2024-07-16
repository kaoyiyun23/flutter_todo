import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/common_drawer.dart';
import 'package:flutter_application_2/components/todo_component.dart';
import 'package:flutter_application_2/daos/todo_dao.dart';
import 'package:provider/provider.dart';

//為了讓畫面具有動態效果，繼承StatefulWidget
//為了有效保存用戶的任務輸入，在裡面設計一個List，名為todoList，用來存放用戶輸入
//透過createStatec函數，調動_TodoInputDemoScreen這個State類別
class TodoInputDemoScreen extends StatefulWidget {
  //保存用戶輸入的任務資料
  List<String> todoList = [];

  //StatefuleWidget的變化效果出自於這個createState函數
  @override
  State createState() {
    return _TodoInputDemoScreen();
  }
}

class _TodoInputDemoScreen extends State<TodoInputDemoScreen> {
  //每次畫面渲染所執行的函數
  @override
  Widget build(BuildContext context) {
    //在使用TextField的時候，輸入完成後，先前的內容仍會留在上面
    //為使字消息，並需使用新的TextEditingController，並當TextField的參數
    var textEditController = TextEditingController();

    //文字輸入框
    Widget userInputTextField = Container(
      width: 500,
      child: TextField(
        //decoration為裝飾，我們使用inputDecoration進行外觀變化
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "輸入要執行的任務..."
        ),
        //用戶要輸入的字都先經由此controller後轉發到其他功能
        controller: textEditController,
        //當用戶點擊時，傳入先前所輸入的文字，並觸發setState，渲染畫面
        onSubmitted: (inputValue) {
          setState(() {
            //將內容放入List
            //this.widget.todoList.add(inputValue);

            //透過管理總頁面狀態的context，去讀取Provider提供的TodoDao，並調用insertTodo函數插入資料
            context.read<TodoDao>().insertTodo(inputValue);

            //清空輸入欄
            textEditController.clear();
          });
        },
      ),
    );

    /* return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            //文字輸入框
            userInputTextField,
            //用戶所輸入的內容
            //三個點的意思是使該List成為children內的元素
            ...this.widget.todoList.map((taskString) => Text(taskString)).toList()
          ],
        ),
      ),
    ); */

    return Scaffold(
      appBar: AppBar(),
      drawer: CommonDrawer.getDrawer(context),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            //文字輸入框
            userInputTextField,
            ...context.watch<TodoDao>().getTodos().map(
              (taskTodo) => Container(
                child: TodoComponent(taskTodo),
              )
            ).toList()
          ],
        ),
      ),
    );
  }
}