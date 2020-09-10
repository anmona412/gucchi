# README

## アプリケーション名

ぐっち

## アプリケーション概要

あなたの愚痴にブランドを持たせる,愚痴投稿サイト。  
投稿された愚痴をカテゴリや年代、職業で分けることで、その界隈で足りていない物を集める。  
その集められた愚痴から新しいイノベーションが生まれる、かもしれない。

## URL

## テストアカウント名

## 利用方法

・新規登録からアカウントを作成。  
・ログイン後、プロフィールから年代と職業を決定。  
・トップページの「ぐちる」ボタンからカテゴリをタグを選びつつ、愚痴内容を投稿する。

## 目指した課題解決

オリジナルアプリケーションのアイデアを考えていた際に、業界ごとの詳しい課題は業界を経験した人では無いと分からないと言うことに気づいた。  
業界外の人が関わりのない業界の課題を知るにはどうしたらいいかと考えた結果、足りていないものは愚痴の形で現れるのではないかと言う考えに至った。  
愚痴のみを集めるソーシャルサイトがあれば、業界ごとの課題を浮き彫りにし、今需要があるものは何かを把握することができると考えている。

## 洗い出した要件

| 機能           | 目的                                                                 | 実装状況                                             |
| -------------- | -------------------------------------------------------------------- | ---------------------------------------------------- |
| 投稿機能       | ユーザが愚痴を投稿できる。                                           | 一部バグあり、修正予定                               |
| 投稿表示機     | 投稿された愚痴がトップページに表示される。                           | 実装済み                                             |
| 投稿分類機能   | 投稿された愚痴がカテゴリごとに分類されている。                       | 実装済み                                             |
| 投稿詳細機能   | 投稿された愚痴の詳細ページに移動できる。                             | 詳細ページ作成                                       |
| 投稿編集機能   | 投稿者は詳細ページから投稿された愚痴を変種できる。                   | バグがあるため修正中                                 |
| 投稿削除機能   | 投稿者は詳細ページから投稿を削除できる。                             | 実装済み                                             |
| コメント機能   | ユーザは詳細ページから投稿に対してコメントできる。                   | 未実装                                               |
| いいね機能     | ユーザはコメントに対していいねを付けられる。                         | 未実装                                               |
| 投稿検索機能   | 投稿を検索できる。                                                   | ワードでのみ検索可能。タグ検索などの詳細検索を検討中 |
| アカウント機能 | ユーザはメールアドレスもしくはソーシャルアカウントでユーザ登録できる | 実装済み（Google、Facebook）                         |

## DB 設計

## ローカルでの動作方法

---

# テーブル設計

## users テーブル

| Column   | Type   | Options |
| -------- | ------ | ------- |
| nickname | string |         |
| email    | string |         |
| password | string |         |

### association

has_one :profile
has_many :sns_credentials
has_many :posts

---

## profile テーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| user       | references | foreign_key: true |
| age        | string     | null: false       |
| profession | string     | null: false       |

### association

belongs_to :user

---

## sns_credential テーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| user     | references | foreign_key: true |
| provider | string     |                   |
| uid      | string     |                   |

### association

belongs_to :user

---

## posts テーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| user     | references | foreign_key: true |
| comment  | text       | null: false       |
| industry | string     | null: false       |
| category | string     | null: false       |

### association

belongs_to :user
belongs_to_active_hash :category
has_many :post_tag_relations, dependent: :destroy
has_many :tags, through: :post_tag_relations, dependent: :destroy

---
