# テーブル設計


## usersテーブル

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

## illustsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| title                | string     | null: false,                   |
| description          | text       | null: false,                   |
| application          | string     | null: false,                   |
| prompt               | text       |                                |


## illust_commentsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| illust               | references | null: false, foreign_key: true |
| content              | text       | null: false,                   |

## illust_tagsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| illust               | references | null: false, foreign_key: true |
| name                 | string     |                                |

## illust_likesテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| illust               | references | null: false, foreign_key: true |

## novelsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| title                | string     | null: false,                   |
| content              | string     | null: false,                   |
| application          | string     | null: false,                   |

## novel_commentsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| novel                | references | null: false, foreign_key: true |
| content              | text       | null: false,                   |

## novel_tagsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| novel                | references | null: false, foreign_key: true |
| name                 | string     |                                |

## novel_likesテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| novel                | references | null: false, foreign_key: true |

## itemsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| title                | string     | null: false,                   |
| price                | string     | null: false,                   |
| description          | text       | null: false,                   |
| application          | string     | null: false,                   |

## item_commentsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| item                 | references | null: false, foreign_key: true |
| content              | text       | null: false,                   |

## item_tagsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| item                 | references | null: false, foreign_key: true |
| name                 | string     |                                |

## item_likesテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| item                 | references | null: false, foreign_key: true |


## ordersテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| item                 | references | null: false, foreign_key: true |