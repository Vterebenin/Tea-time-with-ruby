=begin
The Task
Create a processor class that will take in an array of items and perform an 
action on each item, but only if the item was not already processed. The idea 
is that this class will be useful for processing multiple batches of items while 
ensuring that each item only gets processed once, even if the item is included 
in multiple batches.

The processor will support the following methods:

process_items - will be called with an enumerable as its argument and requires a
block. The block passed in is used to process the item, which will only be 
called if the processor determines that the item should in fact be processed.
The item passed into the block will be whatever the item being processed is. 
So if a hash is being processed, the item will be the hash.
processed_items - returns an array of processed items.

identify - The purpose of this method is to allow different object instances 
that represent the same data to be treated as the same. If called, it will 
determine which hash key to use as the identifying value (if a hash is provided) 
or which method to use (if a non-hash item is provided). It accepts a symbol 
or string argument that determines the hash key/method name to be used to 
identify an item. If this method is not called then the item/hash instances 
will be compared to each other directly.

should_process - The purpose of this method is to configure an optional callback 
method that will be used to determine if an item should be processed. This 
optional callback would return true if the item should be processed, otherwise 
it will return false. When this method is used, the callback passed to it will 
be used in conjunction with the built-in "has this item already been processed?" 
logic.

reset - If called will reset the processed item state, allowing items to be 
reprocessed again.

for this quiz i just take a look at BP. this kind of question is new for me.
=end
class BatchItemProcessor
  attr_reader :processed_items
  
  def initialize
    @identify = proc { |obj| obj }
    @processed_items = []
  end
  
  def process_items(items, &block)
    @items ||= []
    @items.push(*items).uniq!(&@identify)
    items_to_process = (@items - @processed_items)
    items_to_process.select!(&@should_process) if @should_process
    items_to_process.each(&block)
    @processed_items.push(*items_to_process)
  end

  def identify(key_or_method)
    @identify = proc { |obj| obj.is_a?(Hash) ? obj[key_or_method] : obj.send(key_or_method) }
  end
  
  def should_process(&block)
    @should_process = block
  end
  
  def reset
    @processed_items = []
    @items = []
  end
end