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

# テーブル設計

## users テーブル

|column|type|options|
|-|-|-|
|user_name|string|null: false|
|email|string|null: false|
|password|string|null: false|

### アソシエーション

- has_many :scores


## scores テーブル

|column|type|options|
|-|-|-|
|user|references|foreign_key: true|
|score|integer||
|score_avg|integer||

### アソシエーション
- belongs_to :user