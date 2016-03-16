defprotocol DeeplyEnumerable do
  @derive Enumerable
  def map_deeply( data, fn_transform )
end

defimpl DeeplyEnumerable, for: Map do
  def map_deeply( map, fn_transform ) do
    DataLeafWalker.map( map, fn_transform )
  end
end


defimpl DeeplyEnumerable, for: List do
  def map_deeply( list, fn_transform ) do
    DataLeafWalker.map( list, fn_transform )
  end
end

