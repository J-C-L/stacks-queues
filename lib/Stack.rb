class Stack
  def initialize
    @store = Array.new
  end

  def push(element)
    @store.push(element)
    #OR @store << element
    #OR Can use @store.unshift(element), but new elements will be coming onto the beginning instead of the end of the array.
  end

  def pop
     return @store.pop
  end

  def top
    return @store.last
  end

  def size
    return @store.length
  end

  def empty?
    return @store.length == 0
    #OR return size == 0
    #OR return @store.empty?
  end

  def to_s
    return @store.to_s
  end
end
