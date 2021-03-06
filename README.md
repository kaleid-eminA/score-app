# README

## アプリケーション名
- ShootingScore

### アプリケーション概要
このアプリケーションは、エアライフル ISSF 10m 60発競技の得点を管理するアプリケーションです。
グラフと一覧でスコアを見やすく表示します。

### URL
https://score-app-8620.herokuapp.com/

### テスト用アカウント
email: test@test
pass: a00000

### 使用方法
新規登録、あるいはログインした後に自分のスコアを入力することができます。
左上にあるフォームからスコアを入力し、その際に400.0~650.0までが入力可能となっています。
初回入力し、送信するとグラフと一覧が表示されるようになっています。
このソフトは射撃スコアの客観視が行えて、自分を見つめることができます。

### 目指した課題解決
このアプリケーションは大学生や射撃を趣味とする人を目標にしています。
大学生では、サークルや部活でのモチベーションの維持、自分のスコアを把握しグラフで客観視することによって、"調子"などを把握することができます。
先輩や後輩のデータを見ることで指導なども可能となります。
射撃を趣味とする人（社会人）では撃って、スコアを確認して終わり。という虚しさがなくなります。
自分のスコアがグラフで表示されると"あの時と比べて上手くなった"あるいは"下手になった"が把握でき、今後の射撃法を考える一端になるかと思います。

### gif
[![Image from Gyazo](https://i.gyazo.com/08677fbbb945f843385c42f89ee704e8.gif)](https://gyazo.com/08677fbbb945f843385c42f89ee704e8)
[![Image from Gyazo](https://i.gyazo.com/616ad97378ce55ea51d7ea29f68b5c62.gif)](https://gyazo.com/616ad97378ce55ea51d7ea29f68b5c62)

 
 ### 洗い出した要件
 - 新規登録ができる
 - ログインができる
 - ログアウトができる
 - スコアが入力できる
 - スコアが一覧に表示される
 - スコアに日時が表示される
 - スコアがグラフに表示される
 - スコアの平均値が出る
 - スコアを削除できる
 - 上位スコアが一覧で表示できる
 - お問い合わせ機能で作成者にエラーなど伝えることができる
 - 射場の名前を選択できる

### 使用言語・フレームワーク・DB
- ruby 2.6.5
- rails 6.0.4
- mysql 5.6.51

###  実装予定の機能
- 射場の名前を選択できる

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

## contacts テーブル

|column|type|options|
|-|-|-|
|name|string|null: false|
|email|string|null: false|
|content|text|null: false|
