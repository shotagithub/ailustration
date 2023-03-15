# テーブル設計


## usersテーブル
### なりすまし防止のためニックネームのユニークはtrue
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| email                | string     | null: false, uniqueness: true  |
| encrypted_password   | string     | null: false,                   |
| nickname             | string     | null: false, uniqueness: true  |
| last_name            | string     | null: false                    |
| first_name           | string     | null: false                    |
| last_name_ruby       | string     | null: false                    |
| first_name_ruby      | string     | null: false                    |
| birth                | date       | null: false                    |
| prefecture           | string     | null: false                    |
| municipality         | string     | null: false                    |
| address              | string     | null: false                    |
| building             | string     |                                |

###　Association

- has_many :illusts
- has_many :illust_comments
- has_many :illust_likes
- has_many :novels
- has_many :novel_comments
- has_many :novel_likes
- has_many :products
- has_many :product_comments
- has_many :product_likes
- has_many :orders
- has_one  :carts



## illustsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| title                | string     | null: false,                   |
| description          | text       | null: false,                   |
| application          | string     | null: false,                   |
| prompt               | text       |                                |

###　Association

- has_many :illust_comments
- has_many :illust_likes
- has_many :illust_tag_relations
- has_many :illust_tags, through: :illust_tag_relations
- has_many_attached :images
- belongs_to :user



## illust_commentsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| illust               | references | null: false, foreign_key: true |
| text                 | text       | null: false,                   |

###　Association

- belongs_to :user
- belongs_to :illust



## illust_tagsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| illust               | references | null: false, foreign_key: true |
| name                 | string     | null:false, uniqueness:   true |

###　Association

- has_many :illust_tag_relations
- has_many :illust, through: :illust_tag_relations



## illust_likesテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| illust               | references | null: false, foreign_key: true |

###　Association

- belongs_to :user
- belongs_to :illust



## novelsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| title                | string     | null: false,                   |
| application          | string     | null: false,                   |

###　Association

- has_many :novel_comments
- has_many :novel_likes
- has_many :novel_tag_relations
- has_many :novel_tags, through: :novel_tag_relations
- has_many_attached :images
- belongs_to :user



## novel_commentsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| novel                | references | null: false, foreign_key: true |
| text                 | text       | null: false,                   |

###　Association

- belongs_to :user
- belongs_to :novel



## novel_tagsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| novel                | references | null: false, foreign_key: true |
| name                 | string     | null:false, uniqueness:   true |

###　Association

- has_many :novel_tag_relations
- has_many :novel, through: :illust_tag_relations



## novel_likesテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| novel                | references | null: false, foreign_key: true |

###　Association

- belongs_to :user
- belongs_to :novel



## productsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| title                | string     | null: false,                   |
| price                | string     | null: false,                   |
| description          | text       | null: false,                   |
| application          | string     | null: false,                   |

###　Association

- has_many :product_comments
- has_many :product_likes
- has_many :product_tag_relations
- has_many :product_tags, through: :product_tag_relations
- has_many_attached :images
- has_one :order
- belongs_to :user
- belongs_to :cart



## product_commentsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| product              | references | null: false, foreign_key: true |
| text                 | text       | null: false,                   |

###　Association

- belongs_to :user
- belongs_to :product



## product_tagsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| product              | references | null: false, foreign_key: true |
| name                 | string     | null:false, uniqueness:   true |

###　Association

- has_many :product_tag_relations
- has_many :product, through: :product_tag_relations



## product_likesテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| product              | references | null: false, foreign_key: true |

###　Association

- belongs_to :user
- belongs_to :product


## ordersテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| product              | references | null: false, foreign_key: true |

###　Association

belongs_to :user
belongs_to :product


## cartsテーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |

###　Association

- belongs_to :user
- has_many   :products