defmodule DataLeafWalkerTest.StructTest do
  defstruct foo: 1, bar: []
end
defimpl DeeplyEnumerable, for: DataLeafWalkerTest.StructTest do
  def map_deeply( struct, fn_transform ) do
    DataLeafWalker.map( struct, fn_transform )
  end
end

	
defmodule DataLeafWalkerTest do

  use ExUnit.Case
  doctest DataLeafWalker

  @plain_list   [1, 2, 3]
  @nested_lits  [1, 2, [ 3, 4 ], [5, [6]]]
  @keyword_list [ a: 1, b: 2, c: 3 ]
  @plain_map    %{ a: 1, b: 2, c: 3 }
  @nested_map   %{ a: %{ b: 2, c: 3 }, d: 4 }
  @mixed_list   [1, %{ a: 2, b: 3}, [ c: 4, d: 5], { :e, 6} ]
  @mixed_map    %{ a: [1,2,3], b: [ c: 4, d: 5 ]}
	@plain_struct %DataLeafWalkerTest.StructTest{ foo: 2 }

  test "apply +1" do
    fn_transform = &( &1 + 1 )

    assert DeeplyEnumerable.map_deeply( @plain_list, fn_transform ) == [ 2, 3, 4 ]
    assert DeeplyEnumerable.map_deeply( @nested_lits, fn_transform ) == [ 2, 3, [ 4, 5], [6, [7]] ]
    assert DeeplyEnumerable.map_deeply( @keyword_list, fn_transform ) == [a: 2, b: 3, c: 4]
    assert DeeplyEnumerable.map_deeply( @plain_map, fn_transform ) == %{ a: 2, b: 3, c: 4}
    assert DeeplyEnumerable.map_deeply( @nested_map, fn_transform ) == %{ a: %{ b: 3, c: 4 }, d: 5 }
    assert DeeplyEnumerable.map_deeply( @mixed_list, fn_transform ) == [2, %{ a: 3, b: 4}, [ c: 5, d: 6], { :e, 7} ]
    assert DeeplyEnumerable.map_deeply( @mixed_map, fn_transform ) == %{ a: [2,3,4], b: [ c: 5, d: 6 ]}
    assert DataLeafWalker.map( @plain_struct, fn_transform ) == %DataLeafWalkerTest.StructTest{ foo: 3, bar: [] }

  end
end
