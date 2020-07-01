# FISHING-INFO DB設計

## 概要
釣果情報アプリケーションを作成しました。

## 接続先情報
- デプロイ先：https://fishing-info.herokuapp.com/

## 開発状況
- 開発環境
  - Ruby/Ruby on Rails/PostgreSQL/Github/heroku/Visual Studio Code
  
- 開発期間と平均作業時間
  - 開発期間：約2週間
  - 1日あたりの平均作業時間：約10時間


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: false|
|password|string|null: false|
|nickname|string|null: false, unique: false|
### Association
- has_many :posts
- has_many :comments


## postsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|------|
|content|text|------|
|image|string|null: false|
|area|string|-------|
|rank|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments
- has_many :posts_tags
- has_many :tags, through: :posts_tags


## Tagsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
### Association
- has_many :posts_tags
- has_many :posts, through: :posts_tags


## posts_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :tag


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :post