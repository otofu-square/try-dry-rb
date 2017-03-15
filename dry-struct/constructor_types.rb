require 'dry-struct'

# dry-types のモジュールを用意しておく
module Types
  include Dry::Types.module
end

# Dry::Struct では Constructer type という値を設定できる
# その設定によって構造体に定義されていないキーが渡された際の挙動が変わる

# permissive type
class User < Dry::Struct
  constructor_type :permissive

  attribute :name, Types::Strict::String
  attribute :age,  Types::Strict::Int
end

# constructor_type を指定しなかった場合、`permissive` になる
# 構造体の要素の指定が足りない場合は例外が発生する
user = User.new(age: 12) # => raise Dry::Struct::Error
# 構造体に未定義の要素が指定された場合は無視される
user = User.new(name: 'otofu', age: 12, hoge: 'hoge') # => #<User name="otofu" age=12>


# schema type
class User < Dry::Struct
  constructor_type :schema

  attribute :name, Types::Strict::String.default('hoge')
  attribute :age,  Types::Strict::Int
end

# `schema` では構造体の要素が指定されなかった場合デフォルト値が適用され
# 未定義の要素が指定された場合は無視される
user = User.new(age: 12, hoge: 'hoge') # => #<User name="hoge" age=12>


# strict type
class User < Dry::Struct
  constructor_type :strict

  attribute :name, Types::Strict::String
  attribute :age,  Types::Strict::Int
end


# strict_with_defaults type
class User < Dry::Struct
  constructor_type :strict_with_defaults

  attribute :name, Types::Strict::String
  attribute :age,  Types::Strict::Int
end


# weak, symbolized type
class User < Dry::Struct
  constructor_type :

  attribute :name, Types::Strict::String
  attribute :age,  Types::Strict::Int
end
