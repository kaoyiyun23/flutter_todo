import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/common_drawer.dart';

//設計StatefulWidget，設定新狀態與保存狀態
//未來用戶操作頁面時，可及時更換該內容，對畫面重新渲染變化
class ColorfulDemoScreen extends StatefulWidget {
  //用來判斷顏色是否為紅色
  bool currentColorisRed = true;

  //傳回一個類別為State<ColorfulDemoScreen>的物件
  @override
  State createState() {
    return _ColorfulDemoScreenState();
  }
}

//建立State，供Stateful Widget觸發setState時，重新進行build函數，進行畫面繪製
class _ColorfulDemoScreenState extends State<ColorfulDemoScreen> {
  //與先前StatelessWidget的build函數雷同
  //用來進行畫面繪製
  @override
  Widget build(BuildContext context) {
    //為了讓學員方便觀察點擊按鍵前後的狀態屬性變化，在用戶尚未點擊按鈕時，就先行檢閱屬性一次
    print("進入build函數時，widget的currentColorisRed");
    print(this.widget.currentColorisRed);

    //依照新屬性，重新建置一個帶顏色的容器
    //當widget的currentColorisRed是ture時，則印製紅色容器
    //當widget的currentColorisRed是false時，則印製藍色容器
    Widget colorfulContainer;
    if(this.widget.currentColorisRed == true) {
      colorfulContainer = Container(
        color: Colors.red,
        width: 300,
        height: 300,
      );
    }
    else{
      colorfulContainer = Container(
        color: Colors.blue,
        width: 300,
        height: 300,
      );
    }

    //設置一個Column，在第一列建立一個文字按鈕，在第二列傳入一個可變化頁面的Widget
    return Scaffold(
      appBar: AppBar(),
      drawer: CommonDrawer.getDrawer(context),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
              //設置一個文字按鈕，當點擊時會變化原Widget的currentColorisRed變數
              child: TextButton(
                child: Text("按我會變色"),
                onPressed: () {
                  //觸發setState(){}，Flutter會重新執行build函數，重新進行畫面渲染
                  setState(() {
                    print("用戶點擊過程中，widget的currentColorisRed屬性");
                    print(this.widget.currentColorisRed);
                    //變更原來widget屬性
                    this.widget.currentColorisRed =! this.widget.currentColorisRed;
                    print("用戶點擊過程後，widget的currentColorisRed屬性，重新賦值");
                    print(this.widget.currentColorisRed);
                  });
                },
              ),
            ),
            //將先前依照currentColorisRed的Widget，經畫面渲染後，置於此處
            colorfulContainer
          ],
        ),
      )

    );
  }
}