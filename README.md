# DeeplyEnumerable and DataLeafWalker

Traverse and map values of deeply nested data structures: Provides a
`map_deeply/2` function for Maps and Lists and Keyword Lists.

rroouugghhllyy based on ideas from Perl's Data::Leaf::Walker

## Synopsis

```elxir
data = [1, 2, 3, [{:a, 2}, {:b, 4}], %{ a: 2 } ]
DeeplyEnumerable.map_deeply map, &( &1 + 1 )

# yields
[2, 3, 4,[a: 3, b: 5], %{a: 3}]
```

## Usage

```elxir
DeeplyEnumerable.map_deeply( data, fn( value ) -> ...transform value... end )
```

Where data can ba a map, list or keyword list.

## Direct usage of DataLeafWalker

Or, you may DataLeafWalker's `map/2` directly (_discouraged_):

```elxir
DataLeafWalker.map( data, fn( value ) -> ...transform value... end )
```

The difference beetween the _module_ DataLeafWalker and the _protocol_
DeeplyEnumerable is that by implementing the latter for your structs
you may add in extra functionality to the transformation or make it
conditionally transform or whatever. I needed this feature, that's why
it's here. For Lists and Maps, DeeplyEnumerable is already implemented
(simply calling to `DataLeafWalker.map/2`). Though it seems overkill
at first glance, having an extension entry point to your
transformations of complex structs is usually a safe thing.

## Structs

In order to support structs you may either use `DataLeafWalker.map/2`
or (better) implement `DeeplyEnumerable` for you struct type, most
often like this:

```elxir
defimpl DeeplyEnumerable, for: MyStruct do
  def map_deeply( struct, fn_transform ) do
    DataLeafWalker.map( struct, fn_transform )
  end
end
```

## What I use this for

I have to migrate ancient projects that use YAML-serialized in database columns.
Unfortunately they are doubly UTF-8 encoded so I convert these deeply-nested
maps into maps of the same structure with all values decoded into proper UTF-8.

## Installation

The package can be installed as:

  1. Add data_leaf_walker to your list of dependencies in `mix.exs`:

        def deps do
          [{:data_leaf_walker, "~> 0.1.0"}]
        end

## Todo

 - [ ] make keys subject to mappability, too.
 - [x] support structs.
 - [ ] add proper docs
 - [x] really a protocol? _Yes_
 - [ ] add property-based tests. more tests.
