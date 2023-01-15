#テーブル設計

## user テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | -----------------------  |
| nickname           | string | null: false              |
| email              | string | null: false unique: true |
| encrypted_password | string | null: false              |
| first_name         | string | null: false              | 
| last_name          | string | null: false              |
| first_name_kana    | string | null: false              |
| last_name_kana     | string | null: false              | 
| birthday           | data   | null: false              |


### Association

- has_many :items
- has_one  :order


## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| content             | text       | null: false                    |
| category_id         | integer    | null: false                    |
| state_id            | integer    | null: false,                   |
| delivery_charge_id  | integer    | null: false                    |
| sender_id           | integer    | null: false                    |
| date_of_shipment_id | integer    | null: false                    |
| price               | string     | null: false                    |
| user_id             |references  | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :order


## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_id            | references | null: false, foreign_key: true |
| user_id            | references | null: false, foreign_key: true |


### Association

- has_one  :user
- has_one  :address
- has_many :items


# addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_number        | string     | null: false                    |
| prefectures        | string     | null: false                    |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| Building name      | string     |                                |
| Telephone number   | string     | null: false                    |
| order_id           | references | null: false, foreign_key: true |

### Association

- has_one  :order