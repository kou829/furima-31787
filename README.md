# テーブル設計

## users テーブル

| Column           | Type     | Options                   |
| ---------------- | -------- | ------------------------- |
| nickname         | string   | null: false               |
| email            | string   | null: false, unique: true |
| password         | string   | null: false, unique: true |
| last-name        | string   | null: false               |
| first-name       | string   | null: false               |
| last-name-kana   | string   | null: false               |
| first-name-kana  | string   | null: false               |
| birth-date       | integer  | null: false               |

### Association
- has_many :items
- has_many :orders


## items テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| item-images              |            | null: false                    |
| item-name                | string     | null: false                    |
| item-info                | text       | null: false                    |
| item-category            | integer    | null: false                    |
| item-sales-status        | integer    | null: false                    |
| item-shipping-fee-status | integer    | null: false                    |
| item-prefecture          | integer    | null: false                    |
| item-schecluled-delivery | integer    | null: false                    |
| item-price               | integer    | null: false                    |
| add-tax-price            | integer    | null: false                    |
| profit                   | integer    | null: false, foreign_key: true |
| user                     | reference  | null: false, foreign_key: true |


### Association
- belongs_to :users
- has_one :orders


## orders テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | reference  | null: false, foreign_key: true |
| item                | reference  | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items
- has_one :addresses


## addresses テーブル
| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| postal-code  | string     | null:false                    |
| prefectere   | integer    | null:false                    |
| city         | string     | null:false                    |
| addresses    | string     | null:false                    |
| building     | string     | null:false                    |
| phone-number | string     | null:false                    |
| order        | reference  | null:false, foreign_key: true |

### Association
-  belongs_to :orders

