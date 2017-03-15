require 'dry-struct'

# dry-types のモジュールを用意しておく
module Types
  include Dry::Types.module
end

# Dry::Struct を継承したクラスを実装する
class User < Dry::Struct
  # attribute で構造体の要素名を定義し
  # Dry::Types で定義されている型を指定する
  attribute :name, Types::Strict::String
  attribute :age,  Types::Strict::Int
end

# 型に適合しない値があった場合は例外が発生する
user = User.new(
  name: 123,
  age:  true
)
# => Dry::Struct::Error
#    [User.new] 123 (Integer) has invalid type for :name

# 例外には最初に型に適合しなかった値のエラーメッセージのみ表示される
user = User.new(
  name: 'otofu-square',
  age:  true
)
# => Dry::Struct::Error
#    [User.new] true (TrueClass) has invalid type for :age

# 全ての attributes が型に適合するとインスタンスが作れる
user = User.new(
  name: 'otofu-square',
  age:  25
)

# `#to_h` でハッシュ化できる
user      # => #<User name="otofu-square" age=26>
user.to_h # => {:name=>"otofu-square", :age=>26}

# `.` or  `[]` でアクセス可能
user[:name] # => 'otofu-square'
user[:age]  # => 25
user.name   # => 'otofu-square'
user.age    # => 25
