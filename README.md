# FISHING-INFO

## 概要
- 釣果情報アプリケーションを作成しました。1枚のみですが画像を投稿し、編集削除ができます。
- また、投稿それぞれにコメントができるようになっています。
- 検索機能も実装し、投稿に付随するカラム値の検索ができます。
- 非同期通信でのチャットができる場所も設けています。

## 接続先情報
- デプロイ先：https://fishing-info.herokuapp.com/

- ログイン用テストID
    - メールアドレス：test@test
    - パスワード：test@test

## 制作背景
- 自分の趣味が海釣りなのですが、誰でも手軽に釣果情報を投稿できるWebアプリが欲しいと思っていたので作成しました。既存のWebアプリでは複数投稿故に情報がどんどん更新され、欲しい情報の検索をする際に時間がかかったりするので、あえて1枚投稿にしました。また、しっかりとエリアと満足度を記載する欄を設けることで、どこの場所でどれだけ魚影が濃いのかを、検索ですぐにわかるようにしました。既にアップロードされている画像のみですが、魚料理を投稿できる箇所も実装しました。スクールで習った事を実際にアプリに昇華できる良い機会だと思い、習った事を全て詰め込みました。

## 工夫した点
- 既存のWebアプリで存在するイメージマップという技術に感銘を受け、そのまま実装すると共に、別の箇所で少し手を加えて、
  「ウォーリーを探せ」という人探しゲームをそのまま実装しました。
- herokuのアップロードファイルをそのまま用いるとアップロードした画像が、1日で消えてしまうのでアップロード先に
  AWSのS3を用いることで、永久に画像を残せるようにしました。
- スクールのカリキュラムで一番難しいと感じた非同期通信でのチャットを実装しました。

## DEMO
[![Image from Gyazo](https://i.gyazo.com/1fefff926302a6b3989f948ebf9fc83e.jpg)](https://gyazo.com/1fefff926302a6b3989f948ebf9fc83e)
[![Image from Gyazo](https://i.gyazo.com/611de860190dfc6f26ffd3cc6696f2c2.png)](https://gyazo.com/611de860190dfc6f26ffd3cc6696f2c2)
[![Image from Gyazo](https://i.gyazo.com/0c01084fcd54442cf16d49cdfded96de.png)](https://gyazo.com/0c01084fcd54442cf16d49cdfded96de)
[![Image from Gyazo](https://i.gyazo.com/24f3472b17ae8ffb96a5a21e3c79e721.jpg)](https://gyazo.com/24f3472b17ae8ffb96a5a21e3c79e721)
[![Image from Gyazo](https://i.gyazo.com/36d277f9b6c8c08858ddde8b0e4460c4.png)](https://gyazo.com/36d277f9b6c8c08858ddde8b0e4460c4)
[![Image from Gyazo](https://i.gyazo.com/d8b9fe5aa2b99d180bbae9ce42d8a662.jpg)](https://gyazo.com/d8b9fe5aa2b99d180bbae9ce42d8a662)
[![Image from Gyazo](https://i.gyazo.com/0f9f1d42dfbb1c2c6a3b199555dca25e.jpg)](https://gyazo.com/0f9f1d42dfbb1c2c6a3b199555dca25e)
[![Image from Gyazo](https://i.gyazo.com/229bf0bb66de7bc7a613e03ec710e556.jpg)](https://gyazo.com/229bf0bb66de7bc7a613e03ec710e556)

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