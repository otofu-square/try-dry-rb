require 'dry-types'

module Types
  include Dry::Types.module
end

# ---------------------------------------------------------
# - sum
#   `|` メソッドを使って sum types を定義できる
#   Optional values は `|` による表現のシンタックスシュガーになっている
# ---------------------------------------------------------

# `|` を使った書き方
nil_or_string = Types::Strict::Nil | Types::Strict::String

nil_or_string[nil]     # => nil
nil_or_string["hello"] # => "hello"
nil_or_string[123]     # => raises Dry::Types::ConstraintError

# 上記の書き方のシンタックスシュガー
nil_or_string = Types::Strict::String.optional

nil_or_string[nil]     # => nil
nil_or_string["hello"] # => "hello"
nil_or_string[123]     # => raises Dry::Types::ConstraintError
