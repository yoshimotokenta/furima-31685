# テーブル設計

## user テーブル

| Column      | Type   | Options    |
| --------    | ------ | ---------- |
| email       | string | null false |
| password    | string | null false |
| nickname    | string | null false |
|  first_name | string | null false |
| family_name | string | null false |
|  birthday   | string | null false |

## Association
has_many :purchaser
has_many :items

## items テーブル

| Column      | Type    | Options      |
| --------    | ------  | ----------   |
| seller_id   | string  | null false   |
| category_id | string  | null false   |
| condition   | string  | null false   |
|    area     | string  | null false   |
|estimated_id | string  | null false   |
|    user     |resources|foreign key id|
|     name    |  string |  null false  |
|     info    |   text  |  null false  |
|  price_id   | string  | null false   |

## Association
belongs_to :users
has_one :purchasers

## purchasers テーブル
| Column      | Type   | Options    |
| ----------- | ------ | ---------- |
|     user    | string | null false |
|    item     | string | null false |

## Association
has_one address
belongs_to users
belongs_to items

## address テーブル
|postal code_id | string    | null false   |
|municipality_id|  string   | null false   |
|  number_id    |  string   | null false   |
| building name |  string   |              |
|phone number_id|  string   | null false   |
|    user       |resources  |foreign key id|
|    item       |resources  |foreign key id|
 
 ## Association
 belong_to :purchasers
 