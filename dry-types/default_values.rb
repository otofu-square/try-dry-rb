require 'dry-types'

module Types
  include Dry::Types.module
end

# ---------------------------------------------------------
# - Default values
#   型に初期値を定義する
# ---------------------------------------------------------

# Strict
PostStatus = Types::Strict::String.default('draft')

PostStatus[nil]         # => "draft"
PostStatus["published"] # => "published"
PostStatus[true]        # => Dry::Types::ConstraintError

# Coercible
PostStatus = Types::Coercible::String.default('draft')

PostStatus[nil]         # => "draft"
PostStatus["published"] # => "published"
PostStatus[true]        # => "true"
