require 'dry-types'

module Types
  include Dry::Types.module
end

# ---------------------------------------------------------
# - definition
#   String や Integer など Ruby 標準のプリミティブなクラスの型定義
# ---------------------------------------------------------

Types::Nil
Types::Symbol
Types::Class
Types::True
Types::False
Types::Bool
Types::Date
Types::DateTime
Types::Time
Types::Array
Types::Hash

# この定義だけでは型チェックが行えない
Types::Nil[nil]    # => nil
Types::String[123] # => 123
Types::False[true] # => true
