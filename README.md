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

