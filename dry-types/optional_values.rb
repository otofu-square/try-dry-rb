require 'dry-types'

module Types
  include Dry::Types.module
end

# ---------------------------------------------------------
# - Optional values
#   nil もしくは指定した型の値に適合する
#   Maybe を汎用的にしたもの、dry-monads を導入しない環境ではこちらのほうが扱いやすい
# ---------------------------------------------------------

# Strict
optional_strict_string = Types::Strict::String.optional

optional_strict_string[nil]    # => nil
optional_strict_string['hoge'] # => "hoge"
optional_strict_string[123]    # => raises Dry::Types::ConstraintError

# Coercible
optional_coercible_string = Types::Coercible::String.optional

optional_coercible_string[nil]    # => nil
optional_coercible_string['hoge'] # => "hoge"
optional_coercible_string[123]    # => "123"
