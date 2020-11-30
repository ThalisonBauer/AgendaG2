import 'package:floor/floor.dart';
import 'package:AgendaG2/entitys/entity_base.dart';

@Entity(tableName: 'Todos')
class TodoEntity extends EntityBase {
  TodoEntity({
    int id,
    String createdAt,
    String updateAt,
    this.nameContat,
    this.numberContat,
    this.urlavatar,
  }) : super(id, createdAt, updateAt);

  final String nameContat;
  final String numberContat;
  final String urlavatar;
}
