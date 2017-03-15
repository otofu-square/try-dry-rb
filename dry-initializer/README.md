## Docs

http://dry-rb.org/gems/dry-initializer/

## Introduction

クラスを定義する際に、そのクラスのインスタンス変数を型付きで定義できる機能を付加する

## Usage

```ruby
require 'dry-initializer'
require 'dry-types'

class User
  extend Dry::Initializer

  param  :name,  Dry::Types['strict.string']
  param  :role,  default: proc { 'customer' }
  option :admin, default: proc { false }
end

user = User.new('otofu-square', 'admin', admin: true)

user.name  # => "otofu-square"
user.role  # => "admin"
user.admin # => true
```
