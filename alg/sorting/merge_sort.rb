=begin
Сортировка слиянием (англ. merge sort) — алгоритм сортировки, который 
упорядочивает списки (или другие структуры данных, доступ к элементам которых 
можно получать только последовательно, например — потоки) в определённом 
порядке. Эта сортировка — хороший пример использования принципа «разделяй и 
властвуй». Сначала задача разбивается на несколько подзадач меньшего размера. 
Затем эти задачи решаются с помощью рекурсивного вызова или непосредственно,
если их размер достаточно мал. Наконец, их решения комбинируются, и получается 
решение исходной задачи.
=end

def merge_sort(array)
  return array if array.size <= 1
  mid = array.size / 2
  merge(merge_sort(array[0...mid]), merge_sort(array[mid...array.size]))
end

def merge(left, right)
  result = []

  until left.empty? || right.empty?
    result << (left[0] <= right[0] ? left : right).shift
  end

  result.concat(left).concat(right)
end

t = Time.now
p merge_sort([1,8,4,8,])
p Time.now - t