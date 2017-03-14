# Introduction

- 構造的なデータのバリデーションをサポートする gem
- シンプルなハッシュや配列から、複雑な入れ子構造のデータまでバリデーション可能
- 「バリデーションは `simple`, `stateless` で `true or false` が返ってくるべきもの」という基本的な考え方
- バリデーションは正確な表現で記述できるべきだ（ `precense` のような `nil` なのかキーが存在しないの分からない表現は使わない ）
- `dry-validation` は他のバリデーションライブラリには見られないような「型安全」をファーストクラスな機能として持っている

# When to use

- Form params
- GET queries
- JSON documents
- YAML documents
- Application configuration (ie stored in `ENV`)
- Replacement for `ActiveRecord/ActiveModel::Validations`
- Replacement for `strong-parameters`
