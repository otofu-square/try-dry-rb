require 'dry-types'

module Types
  include Dry::Types.module
end

# ---------------------------------------------------------
# - enum
#   Enum を定義できる
# ---------------------------------------------------------

Statuses = Types::Strict::String.enum('reserved', 'draft', 'proceccing', 'completed')

Statuses['reserved']  # => "reserved"
Statuses[0]           # => "reserved"
Statuses['undefined'] # => raise Dry::Types::ConstraintError
