## Usersテーブル

| Column              |Type    |Options      |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | integer| null: false |

### Association
has_many :items
has_many :buys

## itemsテーブル
| Column             |Type        | Options     |
| users_id           | references | null: false | null: false, foreign_key: true |
| item_name          | string     | null: false |
| item_text          | text       | null: false |
| item_category      | integer    | null: false | null: false |
| item_condition     | integer    | null: false | null: false |
| fare_charges       | integer    | null: false | null: false |
| send_area          | integer    | null: false | null: false |
| send_days          | integer    | null: false | null: false |
| price              | integer    | null: false |

### Association
belongs_to :user
has_one :buy


## buysテーブル
| Column             |Type        | Options      |
| users_id           | references | null: false | null: false, foreign_key: true |
| items_id           | references | null: false | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :payment


## addressテーブル
| Column             | Type        | Options     |
| buys_id            | references | null: false | null: false, foreign_key: true |
| send_number        | string     | null: false |
| send_prefecture    | integer    | null: false |
| send_city          | string     | null: false |
| send_address       | string     | null: false |
| send_building      | string     | 
| phone_number       | string     | null: false |

### Association
belongs_to :buys
