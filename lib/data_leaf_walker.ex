defmodule DataLeafWalker do
  
  def map( hash, fn_transform ) when is_map( hash ) do
    Enum.into hash, %{}, fn { key, value } -> 
      { key, transform( value, fn_transform ) }
    end
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
