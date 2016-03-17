# DeeplyEnumerble and DataLeafWalker

Traverse and map values of deeply nested data structures: Provides a
`map_deeply/2` function for Maps and Lists and Keyword Lists. 


## Usage

```
DeeplyEnumerable.map_deeply( data, fn( value ) -> ...transform value... end )
```

Where data can ba a map, list or keyword list. 

```
data = [1, 2, 3, [{:a, 2}, {:b, 4}], %{ a: 2 } ]
DeeplyEnumerable.map_deeply map, &( &1 + 1 )

# yields
[2, 3, 4,[a: 3, b: 5], %{a: 3}]

```

## What I use this for

I have to migrate ancient projects that use YAML-serialized in database columns.
Unfortunately they are doubly UTF-8 encoded so I convert these deeply-nested
maps into maps of the same structure with all values decoded into proper UTF-8.

## Installation

The package can be installed as:

  1. Add data_leaf_walker to your list of dependencies in `mix.exs`:

        def deps do
          [{:data_leaf_walker, "~> 0.0.1"}]
        end

## Todo

[ ] Make keys subject to mappability, too.
[ ] Support structs.
[ ] proper docs
