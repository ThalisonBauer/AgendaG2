import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:AgendaG2/db/database.dart';
import 'package:AgendaG2/entitys/todo_entity.dart';
import 'package:AgendaG2/pages/todo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.db}) : super(key: key);
  final AppDatabase db;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TodoPage(db: widget.db);
              },
            ),
          );
          if (result) {
            setState(() {});
          }
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Meus contatos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: FutureBuilder<List<TodoEntity>>(
            future: widget.db.todoRepositoryDao.getAll(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            onTap: () async {
                              var result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return TodoPage(
                                        db: widget.db,
                                        todo: snapshot.data[index]);
                                  },
                                ),
                              );
                              if (result) {
                                setState(() {});
                              }
                            },
                            leading: Image.network(
                              'https://cdn.iconscout.com/icon/free/png-256/avatar-367-456319.png',
                            ),
                            //Icon(Icons.person_pin, size: 50.0),
                            title: Text(snapshot.data[index].nameContat),
                            subtitle: Text(snapshot.data[index].numberContat),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text('Não há contatos...'),
                    );
            }),
      ),
    );
  }
}
