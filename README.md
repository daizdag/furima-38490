#テーブル設計

## user テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | string | null: false |


### Association

- has_many :items
- has_one  :order


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| content            | text       | null: false                    |
| category           | string     | null: false                    |
| state              | string     | null: false,                   |
| delivery_charge    | string     | null: false                    |
| sender             | string     | null: false                    |
| date_of_shipment   | string     | null: false                    |
| user               | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :order


## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_number        | string     | null: false                    |
| prefectures        | string     | null: false                    |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| Building name      | string     |                                |
| Telephone number   | string     | null: false                    |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |


### Association

- has_one  :user
- has_many :items