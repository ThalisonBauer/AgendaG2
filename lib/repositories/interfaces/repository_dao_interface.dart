import 'package:floor/floor.dart';
import 'package:AgendaG2/entitys/entity_base.dart';

abstract class IRepositoryDaoInterface<Table extends EntityBase> {
  @insert
  Future<int> insertItem(Table item);

  @update
  Future<int> updateItem(Table item);

  @delete
  Future<int> deleteItem(Table item);
}
