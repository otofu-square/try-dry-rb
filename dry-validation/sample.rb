require 'dry-validation'

# スキーマの定義の基本
UserSchema = Dry::Validation.Schema do
  # キーが存在し値が空(nil or '')でないこと
  required(:name).filled

  # キーが存在し、値が Integer かつ 18 以上であること
  required(:age).filled(:int?, gt?: 18)
end

errors = UserSchema.call(name: 'otofu-square', age: 19).messages
# => {}

errors = UserSchema.call(name: '', age: 15).messages
# => {:name=>["must be filled"], :age=>["must be greater than 18"]}

# 複数の条件を and , or で組み合わせることができる
#
# Conjunction (and) の例
ConjunctionSchema = Dry::Validation.Schema do
  required(:age) { int? & gt?(18) }
end

ConjunctionSchema.call(age: 15).messages # => {:age=>["must be greater than 18"]}
ConjunctionSchema.call(age: '19').messages # => {:age=>["must be an integer", "must be greater than 18"]}
ConjunctionSchema.call(age: 19).messages # => {}

# Disjunction (or) の例
DisjunctionSchema = Dry::Validation.Schema do
  # キーが存在しない(nil) or そうでなければ Integer 型
  required(:age) { none? | int? }
end

DisjunctionSchema.call(age: '').messages # => {:age=>["cannot be defined or must be an integer"]}
DisjunctionSchema.call(age: nil).messages # => {}
DisjunctionSchema.call(age: 1).messages # => {}

# Implication (then) の例
# maybe の内部ではこれが使用されている
ImplicationSchema = Dry::Validation.Schema do
  # 値が空でない場合のみ Integer であるかどうかチェックを行う(空は valid)
  required(:age) { filled? > int? }
end

ImplicationSchema.call(age: '').messages # => {}
ImplicationSchema.call(age: nil).messages # => {}
ImplicationSchema.call(age: 19).messages # => {}
ImplicationSchema.call(age: 'string').messages # => {:age=>["must be an integer"]}

# Exclusive Disjunction (xor) の例
ExclusiveDisjunctionSchema = Dry::Validation.Schema do
  required(:eat_cookie).filled
  required(:have_cookie).filled

  rule(be_reasonable: [:eat_cookie, :have_cookie]) do |eat_cookie, have_cookie|
    eat_cookie.eql?('yes') ^ have_cookie.eql?('yes')
  end
end

ExclusiveDisjunctionSchema.call(eat_cookie: 'yes', have_cookie: 'yes').messages # => {:be_reasonable=>["must be equal to yes"]}
ExclusiveDisjunctionSchema.call(eat_cookie: 'yes', have_cookie:  'no').messages # => {}
ExclusiveDisjunctionSchema.call(eat_cookie:  'no', have_cookie: 'yes').messages # => {}
ExclusiveDisjunctionSchema.call(eat_cookie:  'no', have_cookie:  'no').messages # => {:be_reasonable=>["must be equal to yes"]}
