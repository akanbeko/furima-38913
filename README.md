## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| encrypted_password | string | null: false               |
| email              | string | null: false, unique: true |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association
has_many :items
has_many :orders

## itemsテーブル
| Column             |Type        | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| name               | string     | null: false                    |
| text               | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| charges_id         | integer    | null: false                    |
| area_id            | integer    | null: false                    |
| days_id            | integer    | null: false                    |
| price              | integer    | null: false                    |

### Association
belongs_to :user
has_one :order


## ordersテーブル
| Column         |Type        | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :address


## addressesテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------------|
| order              | references | null: false, foreign_key: true |
| send_number        | string     | null: false                    |
| area_id            | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     |                                |
| phone_number       | string     | null: false                    |

### Association
belongs_to :order
