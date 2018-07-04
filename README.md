# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :group_users
- has_many :groups, through: :group_users
- has_many :books
- has_many :notes


## group_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key: true|
|group_id|reference|foreign_key: true|
|admin|boolean|null: false, default: false|

### Association
- belongs_to :user
- belongs_to :group


## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|parent_id|reference|foreign_key: true|
|groupname|string|null: false, unique: true|

### Association
- has_many :group_users
- has_many :users, through: :group_users
- has_many :books


## booksテーブル

|Column|Type|Options|
|------|----|-------|
|bookname|string|null: false, unique: true|
|group_id|reference|foreign_key: true|
|mentor_user_id|reference|foreign_key: true|
|mentee_user_id|reference|foreign_key: true|
|mokuteki_id|reference|foreign_key: true|
|free_spage|text|-|

### Association
- belongs_to :user
- belongs_to :group
- belongs_to :mokuteki
- has_many :notes


## notesテーブル

|Column|Type|Options|
|------|----|-------|
|create_user_id|reference|foreign_key: true|
|book_id|reference|foreign_key: true|
|title|string|-|
|content|text|-|
|image|text|-|
|mentor_content|text|-|
|mentor_image|text|-|
|mentee_content|text|-|
|mentee_image|text|-|

### Association
- belongs_to :user
- belongs_to :book


## mokutekisテーブル

|Column|Type|Options|
|------|----|-------|
|purpose|string|-|

### Association
- has_many :books

