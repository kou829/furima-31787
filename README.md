# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ----------------   | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| password           | string  | null: false, unique: true |
| encrypted_password | string  | null: false, unique: true |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birth_date         | date    | null: false               |

### Association
- has_many :items
- has_many :orders


## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| info                   | text       | null: false                    |
| category_id            | integer    | null: false                    |
| sales-status_id        | integer    | null: false                    |
| shipping-fee-status_id | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| schecluled-delivery_id | integer    | null: false                    |
| price                  | integer    | null: false                    |
| add-tax-price          | integer    | null: false                    |
| profit                 | integer    | null: false, foreign_key: true |
| user                   | reference  | null: false, foreign_key: true |


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
| Column         | Type       | Options                       |
| ------------   | ---------- | ----------------------------- |
| postal_code    | string     | null:false                    |
| prefectere_id  | integer    | null:false                    |
| city           | string     | null:false                    |
| addresses      | string     | null:false                    |
| building       | string     |                               |
| phone_number   | string     | null:false                    |
| order          | reference  | null:false, foreign_key: true |

### Association
-  belongs_to :order

