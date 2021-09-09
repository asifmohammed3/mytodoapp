import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool isComplete = false;
  TextEditingController todoTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "All Todos",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                        color: Colors.grey[800],
                      ),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key(index.toString()),
                      background: Container(
                        padding: EdgeInsets.only(left: 20),
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.delete),
                        color: Colors.red,
                      ),
                      onDismissed: (dir){
                        print("removed");
                      },
                      child: ListTile(
                        onTap: () {
                          setState(() {
                            isComplete = !isComplete;
                          });
                        },
                        leading: Container(
                          padding: EdgeInsets.all(2),
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: isComplete
                              ? Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 20,
                                )
                              : Container(),
                        ),
                        title: Text(
                          "Todo title",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  title: Row(
                    children: [
                      Text("Add Todo"),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.grey,
                          )),
                    ],
                  ),
                  children: [
                    TextFormField(
                      controller: todoTitleController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(hintText: "Exercise"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: ElevatedButton(
                        child: Text("Add"),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).primaryColor),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        onPressed: () {
                          if (todoTitleController.text.isNotEmpty) {
                            print(todoTitleController.text);
                            Navigator.pop(context);
                          }
                        },
                      ),
                    )
                  ],
                );
              });
        },
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
    ;
  }
}
