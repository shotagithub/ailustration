# テーブル設計


## usersテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| nick_name            | string     | null: false                    |
| email                | string     | null: false, uniqueness: true  |
| encrypted_password   | string     | null: false,                   |
| family_name          | string     | null: false                    |
| first_name           | string     | null: false                    |
| family_name_ruby     | string     | null: false                    |
| first_name_ruby      | string     | null: false                    |
| birth_date           | date       | null: false                    |