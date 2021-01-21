# テーブル設計

## users　テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | -------------             |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| first_name          | string  | null: false               |
| last_name           | string  | null: false               |
| first_katakana_name | string  | null: false               |
| last_katakana_name  | string  | null: false               |
| birthday            | date    | null: false               |

### Association

- has_many :products
- has_many :buys
- has_many :comments

## products　テーブル

| Column           | Type         | Options           |
| ---------------- | ------------ | ----------------- |
| title            | string       | null: false       |
| user             | references   | foreign_key: true |
| description      | text         | null: false       |
| category_id      | integer      | null: false       |
| condition_id     | integer      | null: false       |
| shipping_user_id | integer      | null: false       |
| shipping_area_id | integer      | null: false       |
| shipping_day_id  | integer      | null: false       |
| price            | integer      | null: false       |

### Association

belongs_to :user
has_one    :buy
has_many :comments

## buys　テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| product            | references | foreign_key: true |
| user               | references | foreign_key: true |

### Association

belongs_to :product
belongs_to :user
has_one :shipping address

## shipping address テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| buy              | references | foreign_key: true |
| postal_code      | string     | null: false       |
| shipping_user_id | integer    | null: false       |
| city             | string     | null: false       |
| address          | string     | null: false       |
| building         | string     |                   |
| phone_number     | string     | null: false       |

### Association

belongs_to :buy

## comments　テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| comments         | text       | null: false       |
| product          | references | foreign_key: true |
| user             | references | foreign_key: true |

### Association

belongs_to :product
belongs_to :user