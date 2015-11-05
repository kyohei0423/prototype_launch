# PrototypeLaunch
実践的なプログラミングの問題を提供するサービス

- コミットメッセージ記述方法
- コア機能
  - 問題投稿
  - 解答投稿
  - ユーザー概念
  - タグ付け
- データベース設計

# コミットメッセージでよく使う動詞

## Add *A to *B
*Aを*Bに加える

## Remove *A from *B
*Bから*Aを取り除く

## Move *A from *B to *C
*Aを*Bから*Cに動かす

## Replace *A with *B
*Aを*Bに取り替える

## Make *A *B
*A を*Bにする、させる

## Change *A to *B
*Aを*Bに変更する.

## Update *A to *B
*Aを*Bに更新する

## Ensure *A
(that節と一緒に使う)*A である事を確実にする.

## Use *A
*A を使う.
以下と一緒に使うことが多い
### for *P
*P のために
### instead of *P
*P の代わりに
### in *P
*Pの中で
### at *P
*Pで
### as *P
*Pとして

## Fix *A
*Aを直す


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

