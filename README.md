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
- has_many :buyer
- has_many :comments

## items テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| seller_name       | string | null: false |
| item_name         | string | null: false |
| item_show         | text   | null: false |
| category          | integer| null: false |
| item_status       | integer| null: false |
| trasnfee          | integer| null: false |
| transregion       | integer| null: false |
| arrivingdate      | integer| null: false |
| arrivingaddress   | integer| null: false |
| price             | string | null: false |

### Association

- has_many :commnets
- has_many :buyer

## buyer テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key:true  |
| user   | references | null: false, foreign_key: true |

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