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

# er図とクラス図の出力方法
以下データベースがすでに存在することを前提とする。

## er図を作成

```command
bundle exec rake erd
```

## クラス図を作成

```command
bundle exec rake diagram:all
```

/doc下にsvgファイルが保存される

# erbをslimに変換

app/views/以下の.erbをslimに一括変換するRubyワンライナー

```command
for i in app/views/**/*.erb; do erb2slim $i ${i%erb}slim && rm $i; done
```

app/views/devise以下にあるファイルを変換

```command
for file in app/views/devise/**/*.erb; do erb2slim $file ${file%erb}slim && rm $file; done
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

### 使用するgem

- devise

## タグ


# データベース設計

- questions
  - title
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
