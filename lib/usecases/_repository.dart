abstract class IRepository<T> {
  Future<void> create(T data);
  Future<T?> find(int id);
  Future<List<T>> findAll();
  Future<void> update(T data);
  Future<void> delete(int id);
}
