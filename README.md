# データベース設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| kana_last_name     | string | null: false               |
| kana_first_name    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| content             | text       | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| shipping_charges_id | integer    | null: false                    |
| prefectures_id      | integer    | null: false                    |
| shipping_days_id    | integer    | null: false                    |
| price               | integer    | null: false                    |
| user_id             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| item_id | references | null:false, foreign_key: true |
| user_id | references | null:false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| municipalities | string     | null: false                    |
| street_address | string     | null: false                    |
| detail_address | string     |                                |
| telephone      | string     | null: false                    |
| order_id       | references | null: false, foreign_key: true |

### Association

- has_many :orders