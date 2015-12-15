# PrototypeLaunch
実践的なプログラミングの問題を提供するサービス

- コミットメッセージ記述方法
- er図とクラス図の出力方法
- erbをslimに変換
- コア機能
  - 問題投稿
  - 解答投稿
  - ユーザー概念
  - タグ付け
- データベース設計

# er図とクラス図の出力方法
以下データベースがすでに存在することを前提とする。

## er図を作成

```command
bundle exec rake erd
```

# erbをslimに変換

```bash
$ bundle exec erb2slim 変更するerbファイルパス -d(変更するファイルを削除する場合はつける)
```

# コア機能

## 問題投稿

- マークダウンで書けるようにする。
- 文章からどの言語やフレームワークで書かれているのか判定してタグにしたい。
- 記事に関する情報
  - 閲覧数
  - ユーザーが解いた数
  - お気に入り数

## 解答投稿機能

## ユーザー概念

## タグ


# データベース設計

- questions
  - title
  - description
  - sentence
  - time_limit
  - user_id
- answers
  - sentence
  - question_id
  - user_id
- users
  - email
  - password
  - git, facebook, twitter, gplusアカウントからログインできるようにしたい
- tags
  - name
  -taggings_count
- taggings
  - tag_id
  - taggable_id
  - taggable_type
  - tagger_id
  - tagger_type
  - context
- groups
  - name
