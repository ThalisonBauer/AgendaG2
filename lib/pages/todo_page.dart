import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:AgendaG2/db/database.dart';
import 'package:AgendaG2/entitys/todo_entity.dart';

class TodoPage extends StatefulWidget {
  TodoPage({Key key, this.db, this.todo}) : super(key: key);
  final AppDatabase db;
  final TodoEntity todo;

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  var _nameController;

  var _numberController;

  @override
  void initState() {
    _nameController = TextEditingController(
        text: widget.todo != null ? widget.todo.nameContat : '');

    _numberController = TextEditingController(
        text: widget.todo != null ? widget.todo.numberContat : '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_nameController.text.isNotEmpty &&
              _numberController.text.isNotEmpty) {
            var todo = TodoEntity(
              id: widget.todo != null ? widget.todo.id : null,
              numberContat: _numberController.text,
              nameContat: _nameController.text,
              createdAt: DateTime.now().toUtc().toString(),
            );
            if (widget.todo != null) {
              widget.db.todoRepositoryDao.updateItem(todo);
            } else {
              widget.db.todoRepositoryDao.insertItem(todo);
            }

            Navigator.pop(context, true);
          }
        },
        child: Icon(Icons.save),
      ),
      appBar: AppBar(
        title: Text('Novo contato'),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        actions: <Widget>[
          widget.todo != null
              ? IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    widget.db.todoRepositoryDao.deleteItem(widget.todo);
                    Navigator.pop(context, true);
                  },
                )
              : Container(),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Nome',
              ),
            ),
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Número',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
