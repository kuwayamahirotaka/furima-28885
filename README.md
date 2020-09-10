# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| first_name        | string | null: false |
| last_name         | string | null: false |
| first_name_kana   | string | null: false |
| last_name_kana    | string | null: false |
| birth_date        | date   | null: false |

### Association

- has_many :items
- has_one  :buyer
- has_many :comments

## items テーブル

| Column            | Type       | Options     |
| ----------------- | ------     | ----------- |
| user_id           | references | null: false, foreign_key: true |
| name              | string     | null: false |
| show              | text       | null: false |
| category_id       | integer    | null: false |
| status_id         | integer    | null: false |
| trasnfee_id       | integer    | null: false |
| transregion_id    | integer    | null: false |
| price             | string     | null: false |

### Association

- belongs_to :user
- has_many :commnets
- has_many :buyers

## buyer テーブル

| Column            | Type       | Options                        |
| ------            | ---------- | ------------------------------ |
| item              | references | null: false, foreign_key:true  |
| user              | references | null: false, foreign_key: true |
| arrivingdate      | integer    | null: false |
| arrivingaddress   | integer    | null: false |

### Association

- belongs_to :item
- belongs_to :user

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user