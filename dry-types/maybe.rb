# ---------------------------------------------------------
# - maybe
#   nil もしくは指定した型の値に適合する
#   dry-monads という関数型言語のモナドの概念を扱う Gem で主に使用する
# ---------------------------------------------------------

# 初期状態ではロードされていない
Dry::Types.load_extensions(:maybe)
module Types
  include Dry::Types.module
end

# Strict タイプ
Types::Maybe::Strict::String
Types::Maybe::Strict::Int
Types::Maybe::Strict::Float
Types::Maybe::Strict::Decimal
Types::Maybe::Strict::Array
Types::Maybe::Strict::Hash

# nil ならば　`None`, 値が適合すればその値を返す
Types::Maybe::Strict::String[nil] # => None
Types::Maybe::Strict::String['a'] # => Some('a')

# Coercible タイプ
Types::Maybe::Coercible::String
Types::Maybe::Coercible::Int
Types::Maybe::Coercible::Float
Types::Maybe::Coercible::Decimal
Types::Maybe::Coercible::Array
Types::Maybe::Coercible::Hash

# `#maybe` をコールしても同様の型定義ができる
Types::Strict::Int.maybe # = Types::Maybe::Strict::Int
