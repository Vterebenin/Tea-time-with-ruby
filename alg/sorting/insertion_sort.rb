=begin 
Сортировка вставками (англ. Insertion sort) — алгоритм сортировки, в котором
элементы входной последовательности просматриваются по одному, и каждый новый
поступивший элемент размещается в подходящее место среди ранее упорядоченных 
элементов. 

https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Insertion-sort-example-300px.gif/280px-Insertion-sort-example-300px.gif
=end

def insert_sort!(list)
  for i in 1..(list.length - 1)
    value = list[i]
    j = i - 1
    while j >= 0 and list[j] > value
        list[j + 1] = list[j] 
        j -= 1
    end
    list[j + 1] = value
  end
  list
end

t = Time.now
p insert_sort!([9,1,3,5,6,7,8])
p Time.now - t 