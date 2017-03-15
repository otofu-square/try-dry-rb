require 'dry-types'

module Types
  include Dry::Types.module
end

# ---------------------------------------------------------
# - coercible
#   Coercible を指定した型は、渡された値を「指定した definition の`to_*` メソッド」を使ってキャストを試みる
# ---------------------------------------------------------

Types::Coercible::String
Types::Coercible::Int
Types::Coercible::Float
Types::Coercible::Decimal
Types::Coercible::Array
Types::Coercible::Hash

# Types::Coercible::String は `to_s` で渡された値をキャストする
Types::Coercible::String[123] # => '123'
Types::Coercible::String[nil] # => ''
class Hoge
  def to_s; 'hoge'; end
end
Types::Coercible::String[Hoge.new] # => 'hoge'

# Types::Coercible::Int は `to_i` で渡された値をキャストする
Types::Coercible::Int[1.08]     # => 1
Types::Coercible::Int[Time.now] # => 1489583645

# Types::Coercible::Float は `to_f` で渡された値をキャストする
Types::Coercible::Float[1]      # => 1.0
Types::Coercible::Float['1e-2'] # => 0.01

# Types::Coercible::Decimal は `to_d` で渡された値をキャストする
Types::Coercible::Decimal[1] # => 0.1e1

# Types::Coercible::Array は `to_a` で渡された値をキャストする
Types::Coercible::Decimal[{ a: 1, b: 2 }] # => [[:a, 1], [:b, 2]]

# Types::Coercible::Decimal は `to_h` で渡された値をキャストする
Types::Coercible::Decimal[[[:a, 1], [:b, 2]]] # => {:a=>1, :b=>2}
