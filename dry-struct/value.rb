require 'dry-struct'

# dry-types のモジュールを用意しておく
module Types
  include Dry::Types.module
end

# Dry::Struct::Value を継承すると各要素が freeze される構造体を定義できる
class Location < Dry::Struct::Value
  attribute :x, Types::Strict::Float
  attribute :y, Types::Strict::Float
end

location1 = Location.new(x: 1.23, y: 4.56)
location2 = Location.new(x: 1.23, y: 4.56)

location1.x # => 1.23
location1.y # => 4.56
location2.x # => 1.23
location2.y # => 4.56

# Dry::Struct::Value のインスタンスの各要素は freeze されており変更不可
location1.frozen? # => true
location2.frozen? # => true

# Dry::Struct::Value のインスタンス同士は比較可能
# 各要素が等しければ `#==` の結果が true になる
# (dry-equalizer を使って実現している)
location1 == location2 # => true
