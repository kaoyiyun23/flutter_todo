//依照文件的先前設定，設定側邊欄與點擊後的轉發路徑

import 'package:flutter/material.dart';

class CommonDrawer {
  //設置getDrawer靜態函數，無須建立物件，即可呼叫此方法
  static Drawer getDrawer(BuildContext context) {
    return Drawer(
      //避免按鍵過多超出畫面
      child: ListView(
        //放入Listview專用的
        children: [
          ListTile(
            title: const Text('色塊變化'),
            onTap: () {
              //轉發至色塊變化頁面
              Navigator.pushNamed(context, "/color-demo");
            },
          ),
          ListTile(
            title: const Text("工作紀錄"),
            onTap: () {
              //轉發至Todo登記頁面
              Navigator.pushNamed(context, "/task");
            },
          ),
          ListTile(
            title: const Text("工作數量"),
            onTap: () {
              //切換至todo數量統計頁面
              Navigator.pushNamed(context, "/amount");
            },
          )
        ],
      ),
    );
  }
}