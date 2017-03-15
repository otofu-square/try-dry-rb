require 'dry-types'

module Types
  include Dry::Types.module
end

# ---------------------------------------------------------
# - Hash schemas
#   ハッシュのキーとその値の型をまとめて定義できる
#   see: http://dry-rb.org/gems/dry-types/hash-schemas/
# ---------------------------------------------------------

# Schema
hash = Types::Hash.schema(
  name: Types::Strict::String,
  age:  Types::Strict::Int
)
hash[name: 'otofu', age: '25'] # => { :name => "Jane", :age => 21 }
hash[name: 123, age: 'hoge']   # => raises Dry::Types::ConstraintError

# Permissive
hash = Types::Hash.permissive(
  name: Types::String,
  age:  Types::Coercible::Int
)
hash[email: 'jane@doe.org', name: 'Jane', age: 21]
# => Dry::Types::SchemaKeyError: :email is missing in Hash input

# Symbolized
hash = Types::Hash.symbolized(
  name: Types::String,
  age:  Types::Coercible::Int
)
hash['name' => 'Jane', 'age' => '21'] # => { :name => "Jane", :age => 21 }
