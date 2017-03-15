require 'dry-types'

module Types
  include Dry::Types.module
end

# ---------------------------------------------------------
# - Constraints
#   dry-logic に定義されている値のバリデーションを型に適用できる
#   see: http://dry-rb.org/gems/dry-logic/
# ---------------------------------------------------------

string = Types::Strict::String.constrained(min_size: 3)

string['foo'] # => "foo"
string['fo']  # => Dry::Types::ConstraintError: "fo" violates constraints

email = Types::Strict::String.constrained(
  format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
)

email["yukita@feedforce.jp"] # => "jane@doe.org"
email["invalid_email"]       # => Dry::Types::ConstraintError: "jane" violates constraints
