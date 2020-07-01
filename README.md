# FISHING-INFO

## 概要
- 釣果情報アプリケーションを作成しました。1枚のみですが画像を投稿し、編集削除ができます。
- また、投稿それぞれにコメントができるようになっています。
- 検索機能も実装し、投稿に付随するカラム値の検索ができます。
- 非同期通信でのチャットができる場所も設けています。

## 接続先情報
- デプロイ先：https://fishing-info.herokuapp.com/

## 制作背景
- 自分の趣味が海釣りなのですが、誰でも手軽に釣果情報を投稿できるWebアプリが欲しいと思っていたので作成しました。
  また、スクールで習った事を実際にアプリに昇華できる良い機会だと思い、習った事をほぼ全て詰め込みました。

## DEMO
[![Image from Gyazo](https://i.gyazo.com/1fefff926302a6b3989f948ebf9fc83e.jpg)](https://gyazo.com/1fefff926302a6b3989f948ebf9fc83e)

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