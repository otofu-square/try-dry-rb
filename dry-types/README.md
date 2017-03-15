## Docs

http://dry-rb.org/gems/dry-types/

## Introduction

動的型付け言語の Ruby に型を導入するための Gem

```ruby
require 'dry-types'

# dry-types を include したモジュールを実装する
# 基本的には "Types::#{型名}" でアクセスする
module Types
  include Dry::Types.module
end

# 上記のモジュールに独自の型を定義できる
module Types
  # 正規表現を使用してメールアドレスの型を定義する
  Email = String.constrained(format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)

  # 組み込まれている `gt` (greater than) を使って 18 より大きい整数という型を定義する
  Age = Int.constrained(gt: 18)
end

# 型を呼び出すときは定義したモジュールの `[]` メソッドを使用する

# 型に適合する場合は '[]' に渡した値がそのままに返る
Types::Email['yukita@feedforce.jp']
# => 'yukita@feedforce.jp' (String)

# 型に適合しない場合は例外が発生する
Types::Email['invalid_email']
# => raise Dry::Types::ConstraintError
#    "invalid_email" violates constraints (format?(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, "invalid_email") failed)

```

## Built-in Types

dry-types には標準でいくつか型が用意されており、5つのカテゴリが設けられている

- definition
- strict
- coercible
- form
- json
- maybe

## Other gems using dry-types

- [dry-struct](http://dry-rb.org/gems/dry-struct)
- [dry-initializer](http://dry-rb.org/gems/dry-initializer)
- [rom-rb](http://rom-rb.org/)
- [Hanami](https://hanamirb.org/)
- [Trailblazer](http://trailblazer.to/)
