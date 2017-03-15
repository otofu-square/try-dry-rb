require 'dry-types'

module Types
  include Dry::Types.module
end

# ---------------------------------------------------------
# - form
#   Coercible を Web の入力フォームに最適化したもの
# ---------------------------------------------------------

Types::Form::Nil
Types::Form::Date
Types::Form::DateTime
Types::Form::Time
Types::Form::True
Types::Form::False
Types::Form::Bool
Types::Form::Int
Types::Form::Float
Types::Form::Decimal
Types::Form::Array
Types::Form::Hash
