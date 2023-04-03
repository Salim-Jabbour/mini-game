import 'dart:core';

class StackCollection<E> {
  final _list = <E>[];

  void push(E value) => _list.add(value);
  void addAll(Iterable<E> elements) => _list.addAll(elements);

  E? pop() => (isEmpty) ? null : _list.removeLast();
  E? get peek => (isEmpty) ? null : _list.last;

  bool get isEmpty => _list.isEmpty;
  bool get isNotEmpty => _list.isNotEmpty;

  int get length => _list.length;
  void clear() => _list.clear();

  @override
  String toString() => _list.toString();
}
