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
| birthday           | date   | null: false              |


### Association

- has_many   :items
- has_many   :orders


## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| content              | text       | null: false                    |
| category_id          | integer    | null: false                    |
| state_id             | integer    | null: false                    |
| deliverycharge_id    | integer    | null: false                    |
| sender_id            | integer    | null: false                    |
| scheduleddelivery_id | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one   :order


## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one    :address


# addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_number        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| telephone_number   | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association

- belongs_to  :order