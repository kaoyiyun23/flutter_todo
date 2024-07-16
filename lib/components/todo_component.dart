import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/todo.dart';

//程式分層的部分，資料、應用邏輯、視覺邏輯會切割出來
//此處為Todo資料定義了一個視覺化組件，可將Todo資料變成一個可勾選刪除，畫線的組件
class TodoComponent extends StatefulWidget {
  //帶狀態組件核心資料
  Todo todo;

  //建構子
  TodoComponent(this.todo);

  //指定依託的狀態
  @override
  State createState() {
    return _TodoComponentState();
  }
}

//宣告為TodoComponent的狀態
class _TodoComponentState extends State<TodoComponent> {
  //實作build方法
  @override
  Widget build(BuildContext content) {
    //設定一個勾選框，value必須是bool，預設為Todo資料的isComplete
    //設定當用戶勾選時，會對組件重新渲染，將Todo的isComplete更改為用戶當前狀態
    Widget checkTaskCompleteBox = Container(
      child: Checkbox(
        value: this.widget.todo.isComplete,
        //userCheck的資料型態為bool，當用戶勾選為true，沒勾選時為false
        onChanged: (userCheck) {
          setState(() {
            this.widget.todo.isComplete = userCheck!;
          });
        },
      ),
    );

    //設定文字，並依照todo資料的isComplete做樣式的判斷，若為true則有刪除線，false則無
    Widget taskText = Container(
      child: Text(
        this.widget.todo.content,
        //此處的語法表達方式為one sentance if else expresss，單句可作為賦值的if else
        style: (this.widget.todo.isComplete == true) ? TextStyle(decoration: TextDecoration.lineThrough): TextStyle(),
      ),
    );

    //將這兩個組件使用Row以水平方式進行放置
    return Container(
      width: 500,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          checkTaskCompleteBox,
          taskText
        ],
      ),
    );
  }
}