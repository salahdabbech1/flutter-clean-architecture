abstract class BaseRepository<T> {
  Future<T> getById(String id);
  Future<List<T>> getAll();
  Future<void> post(T item);
  Future<void> update(T item);
  Future<void> delete(String id);
}
