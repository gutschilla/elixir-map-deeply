defmodule DataLeafWalker do
  
  def map( hash, fn_transform ) when is_map( hash ) do
		List.foldl(
			Map.keys( hash ),
			%{},
			fn key, acc ->
        old_value = Map.fetch! hash, key 
				new_value = case key do
		      # don not touch __struct__ values as they define the struct type
					:__struct__ -> old_value 
					_           -> transform old_value, fn_transform
				end
				Map.put_new acc, key, new_value 
			end
		)
  end

  def map( list, fn_transform ) when is_list( list ) do
    Enum.map list, fn item -> transform( item, fn_transform) end
  end

  def transform( value, fn_transform ) when is_map( value ) do
    map( value, fn_transform )
  end

  def transform( value, fn_transform ) when is_list( value ) do
    map( value, fn_transform )
  end

  def transform( { key, value }, fn_transform ) do
    { key, fn_transform.( value ) }
  end

  def transform value, fn_transform do
    fn_transform.( value )
  end

end
