require 'dry-types'

module Types
  include Dry::Types.module
end

# ---------------------------------------------------------
# - Array with member
#   ある型を要素として持つ配列、という型を定義できる
# ---------------------------------------------------------

PostStatuses = Types::Strict::Array.member(Types::Strict::String)

PostStatuses[['foo', 'bar']] # => ["foo", "bar"]
PostStatuses[[:foo, :bar]]   # => raises Dry::Types::ConstraintError
PostStatuses[[]]             # => []
PostStatuses[123]            # => raises Dry::Types::ConstraintError
