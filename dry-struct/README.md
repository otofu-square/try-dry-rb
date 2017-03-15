# Docs

http://dry-rb.org/gems/dry-struct/

# Introduction

- 型付きの Struct クラスのような構造体を定義できる gem
- 構造体の各要素に dry-types で定義されている型を適用する
- dry-types, dry-configurable, dry-equalizer がインクルードされている

# Differences between dry-struct and virtus

dry-struct look somewhat similar to Virtus but there are few significant differences:

- Structs don’t provide attribute writers and are meant to be used as “data objects” exclusively
- Handling of attribute values is provided by standalone type objects from dry-types, which gives you way more powerful features
- Handling of attribute hashes is provided by standalone hash schemas from dry-types, which means there are different types of constructors in dry-struct
- Structs are not designed as swiss-army knifes, specific constructor types are used depending on the use case
- Struct classes quack like dry-types, which means you can use them in hash schemas, as array members or sum them
