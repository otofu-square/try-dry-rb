require 'dry-types'

module Types
  include Dry::Types.module
end

# ---------------------------------------------------------
# - strict
#   上述の definition に対して強い型制約を指定する
# ---------------------------------------------------------

Types::Strict::Nil
Types::Strict::Symbol
Types::Strict::Class
Types::Strict::True
Types::Strict::False
Types::Strict::Bool
Types::Strict::Date
Types::Strict::DateTime
Types::Strict::Time
Types::Strict::Array
Types::Strict::Hash

# Strict を指定した型は、適合しない値を渡すと例外を発生させる
# Types::Strict::True[false]
# => raise Dry::Types::ConstraintError
#    false violates constraints (type?(TrueClass, false) failed)
