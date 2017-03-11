require 'dry-types'

module Types
  include Dry::Types.module

  Email = String.constrained(format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
  Age = Int.constrained(gt: 18)
end

Types::Email['yukita@feedforce.jp']
# => 'yukita@feedforce.jp' (String)

Types::Email['invalid_email']
# => Dry::Types::ConstraintError: "invalid_email" violates constraints
#   (format?(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, "invalid_email") failed)

Types::Age[18]
# => Dry::Types::ConstraintError: 18 violates constraints (gt?(18, 18) failed)

Types::Age[100]
# => 100 (Integer)

Types::Age[10]
# => Dry::Types::ConstraintError: 10 violates constraints (gt?(18, 10) failed)

# Support for constrained types



# Support for optional values



# Support for default values



# Support for sum types



# Support for enums



# Support for hash type with type schemas



# Support for array type with members



# Support for arbitrary meta information



# Support for typed struct objects via dry-struct



# Types are categorized, which is especially important for optimized and dedicated coercion logic
# Types are composable and reusable objects
