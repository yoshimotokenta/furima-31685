# テーブル設計

## user テーブル

| Column         | Type   | Options    |
| ---------------| ------ | ---------- |
| email          | string | null false |
| password       | string | null false |
| nickname       | string | null false |
|  first_name    | string | null false |
| family_name    | string | null false |
| birthday today| string | null false |
|first_name_kana | string | null false |
|family_name_kana| string | null false |

## Association
has_many :purchaser
has_many :items

## items テーブル

| Column      | Type    | Options      |
| --------    | ------  | ----------   |
| seller_id   | string  | null false   |
| category_id | string  | null false   |
| condition_id| string  | null false   |
|    area_id  | string  | null false   |
|estimated_id | string  | null false   |
|    user     |reference|foreign key id|
|     name    |  string |  null false  |
|     info    |   text  |  null false  |
|    price    | string  | null false   |

## Association
belongs_to :users
has_one :purchaser

## purchasers テーブル
| Column      | Type    | Options      |
| ----------- | --------| -------------|
|    user    |reference|foreign key id|
|    item     |reference|foreign key id|

## Association
has_one address
belongs_to user
belongs_to item

## address テーブル
|postal code_id | string    | null false   |
|municipality_id|  string   | null false   |
|  number_id    |  string   | null false   |
| building name |  string   |              |
|phone number_id|  string   | null false   |

 ## Association
 belong_to :purchaser
 