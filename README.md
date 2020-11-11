# テーブル設計

## user テーブル

| Column           | Type   | Options    |
| ---------------  | ------ | ---------- |
| email            | string | null false |
|encrypted_password| string | null false |
|    nickname      | string | null false |
|   first_name     | string | null false |
| family_name      | string | null false |
|    birthday      |  date  | null false |
|first_name_kana   | string | null false |
|family_name_kana  | string | null false |

## Association
has_many :purchasers
has_many :items

## items テーブル

| Column      | Type    | Options         |
| --------    | ------- | --------------  |
| seller_id   | integer | null false      |
| category_id | integer | null false      |
| condition_id| integer | null false      |
|    area_id  | integer | null false      |
|estimated_id | integer | null false      |
|    user     |reference|foreign_key: true|
|     name    |  string |  null false     |
|     info    |   text  |  null false     |
|    price    | integer | null false      |

## Association
belongs_to :user
has_one :purchaser

## purchasers テーブル
| Column      | Type    | Options         |
| ----------- | --------| --------------  |
|    user     |reference|foreign_key: true|
|    item     |reference|foreign_key: true|

## Association
has_one address
belongs_to user
belongs_to item

## address テーブル
| Column      | Type    | Options      |
| ----------- | --------| -------------|
| postal_code |  string | null false   |
|municipality |  string | null false   |
|  number     |  string | null false   |
|building_name|  string |              |
|phone_number |  string | null false   |

 ## Association
 belong_to :purchaser
 