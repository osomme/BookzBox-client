abstract class IMemCache<T> {
  void setCache(T item);
  T getCache();
  bool hasCache();
}
