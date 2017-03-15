require 'dry-types'

module Types
  include Dry::Types.module
end

# ---------------------------------------------------------
# - json
#   Coercible を JSON の型チェックに最適化したもの
# ---------------------------------------------------------

Types::Json::Nil
Types::Json::Date
Types::Json::DateTime
Types::Json::Time
Types::Json::Decimal
Types::Json::Array
Types::Json::Hash
