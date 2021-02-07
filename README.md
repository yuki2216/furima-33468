# テーブル設計

## users　テーブル 

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :items
- has_many :orders
- has_many :comments

## items テーブル

| Column           | Type         | Options           |
| ---------------- | ------------ | ----------------- |
| title            | string       | null: false       |
| description      | text         | null: false       |
| category_id      | integer      | null: false       |
| condition_id     | integer      | null: false       |
| shipping_user_id | integer      | null: false       |
| shipping_area_id | integer      | null: false       |
| shipping_day_id  | integer      | null: false       |
| price            | integer      | null: false       |
| user             | references   | foreign_key: true |
### Association

belongs_to :user
has_one    :buy
has_many :comments 

## orders テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| item               | references | foreign_key: true |
| user               | references | foreign_key: true |

### Association

belongs_to :item
belongs_to :user
has_one :address

## address テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| order            | references | foreign_key: true |
| postal_code      | string     | null: false       |
| prefecture       | integer    | null: false       |
| city             | string     | null: false       |
| address          | string     | null: false       |
| building         | string     |                   |
| phone_number     | string     | null: false       |

### Association

belongs_to :order

## comments　テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| comments         | text       | null: false       |
| item             | references | foreign_key: true |
| user             | references | foreign_key: true |

### Association

belongs_to :item
belongs_to :user
