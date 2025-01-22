abstract class DataSource<Entity> {
  const DataSource();

  Future<void> create(Entity entity);
  Future<Entity?> find(int id);
  Future<List<Entity>> findAll();
  Future<void> update(Entity entity);
  Future<void> delete(int id);
}
