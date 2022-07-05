import 'package:flutter/material.dart';

class CardListTile extends StatelessWidget {
  CardListTile({Key? key, required this.onPressed, required this.time, required this.date, required this.title, this.needIcon}) : super(key: key);

  final onPressed;
  final time;
  final date;
  final title;
  final needIcon;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(border: new Border(right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.white),
            ),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

            subtitle: Row(
              children: <Widget>[
                needIcon ? Icon(Icons.report_rounded, color: Colors.redAccent) : Container(),
                SizedBox(
                  width: 5,
                ),
                Text("At ${time.toString()} on ${date.toString()}", style: TextStyle(color: Colors.white)),
              ],
            ),
            onTap: () {
              onPressed();
            },
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0)),
      ),
    );
  }
}
