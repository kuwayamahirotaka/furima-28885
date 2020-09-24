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
- has_many :buyers
- has_many :comments

## items テーブル

| Column            | Type       | Options     |
| ----------------- | ------     | ----------- |
| user              | references | null: false, foreign_key: true |
| name              | string     | null: false |
| show              | text       | null: false |
| category_id       | integer    | null: false |
| status_id         | integer    | null: false |
| trasnfee_id       | integer    | null: false |
| transregion_id    | integer    | null: false |
| transdate         | integer    | null: false |
| price             | integer    | null: false |

### Association

- belongs_to :user
- has_many   :commnets
- has_one    :buyer

## buyer テーブル

| Column            | Type       | Options                        |
| ------            | ---------- | ------------------------------ |
| item              | references | null: false, foreign_key:true  |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :buyeraddress

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user


## buyeraddress テーブル

| Column         | Type       | Options                        |
| -------        | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| building_name  | string     |                                |
| house_number   | string     | null: false                    |
| city           | string     | null: false                    |
| prefecture     | integer    | null: false                    |
| phonenumber    | string     | null: false                    |
| user_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer
- belongs_to_active_hash :prefecture




＃アプリケーション名
フリーマーケットアプリケーション

＃アプリケーション概要
会員登録したユーザが、商品の出品、購入ができる

＃URL
https://furima-28885.herokuapp.com/

＃テスト用アカウント
#Basic認証
ID:admin
pass:2222

#ユーザ情報(購入者)
mail:taro@yahoo.com
pass:taro111

#ユーザ情報(出品者)
mail:jiro@yahoo.com
pass:jiro222

#PAY.JP
number:4242424242424242
month:3
year:23
cvc:123

＃利用方法
ユーザ登録し商品を画像とともに出品

＃目指した課題解決
中古ショップやリサイクルショップの形をネット上で実現することで、
スマホやPCから欲しい商品、気になっていた商品を購入することができる。

＃洗い出した要件
会員登録、商品出品、商品購入

＃実装した機能についてのGIFと説明

＃実装予定の機能
マイページ機能
出品者評価機能
商品検索

＃データベース設計（ER図）
完了

＃ローカルでの動作方法（git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど）。）
