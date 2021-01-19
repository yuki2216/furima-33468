# テーブル設計

## users　テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false |
| password            | string  | null: false |
| first_name          | string  | null: false |
| last_name           | string  | null: false |
| first_katakana_name | string  | null: false |
| last_katakana_name  | string  | null: false |
| birthday            | integer | null: false |

### Association

- has_many :products
- has_many :buy


## products　テーブル

| Column              | Type         | Options     |
| ------------------- | string       | null: false |
| image               | activeStrage |             |
| title               | string       | null: false |
| user                | references   |             |
| description         | string       | null: false |
| category            | string       | null: false |
| condition           | string       | null: false |
| shipping_user       | string       | null: false |
| shipping_area       | integer      | null: false |
| days_ship           | integer      | null: false |
| price               | integer      | null: false |

### Association

belongs_to :user

## buy　テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| product             | references |             |
| user                | references |             |
| card_number         | integer    | null: false |
| expiration_date     | integer    | null: false |
| security_code       | integer    | null: false |
| postal_code         | integer    | null: false |
| prefectures         | integer    | null: false |
| city                | integer    | null: false |
| address             | integer    | null: false |
| building            | integer    | null: false |
| phone_number        | integer    | null: false |

### Association

belongs_to :product
belongs_to :user

## comments　テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| comments            | string     | null: false |
| product             | references |             |
| user                | references |             |

### Association

belongs_to :product
belongs_to :user