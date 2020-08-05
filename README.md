## テーブル

## usersテーブル

| Column | Type       | Options         |
| ------ | ---------- | --------------- |
|familyname        | string  | null:false  |
|lastname          | string  | null:false  |
|kana_familyname   | string  | null:false |
|kana_lastname     | string  | null:false |
|nickname          | string  | null:false |
|email             | string  | null:false |
| passwword        | string  | null:false |
| date             | date    | null:false  |

### Association
- has_many:items
- has_one:purchase

## items
| Column | Type       | Options                   |
| ------ | ---------- | --------------------------|
| image       | string     | null:false |
| name        | string     | null:false |
| comment     | text       | null:false |
| category_id | integer    | null:false |
| status_id   | integer    | null:false |
| feee_id     | integer    | null:false |
| day_id      | integer    | null:false |
| price       | integer    | null:false |
| user        | references | null:false, foreign_key: true|

### Association
- belong_to:user
- has_one:purchase_address
- belong_to:purchase

## purchase_address

| Column | Type       | Options         |
| ------ | ---------- | ----------------|
| prefectures_id | integer | nill:false |
| city           | string  | null:false |
| address        | string  | null:false |
| build          | string  |            |
| tellnum        | string  | null:false | 
| postnum        | string  | null:false |
| item           | references | null:false, foreign_key: true|

### Association
- belong_to:item

## purchase 
| Column | Type       | Options         |
| ------ | ---------- | ----------------|
|user    | references | null:false, foreign_key: true |
|item    | references | null:false, foreign_key: true |

### Association
- belong_to:user
- belong_to:item
