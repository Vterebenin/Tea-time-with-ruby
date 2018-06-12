# return the array containing the tree levels, from root to last level.
def tree_by_levels(node)
  stack=[]
  stack.push node if node
  stack.each do |n|
    stack.push n.left if n.left
    stack.push n.right if n.right
  end
  stack.map! &:value
end