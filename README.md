# audrey-app

「オードリーのオールナイトニッポン」のHPの過去放送のブログから、「日付」「タイトル」「画像」「HPのブログへのリンク」をスクレイピングしました

http://www.allnightnippon.com/kw/

## URL

https://annkw.herokuapp.com/

Basic認証のIDとパスワードは、どちらも「shira」です（現在は必要ないです）


## 制作背景

・オフィシャルホームページの過去放送ブログが使いずらい。ブログ記事一覧や検索機能がないため。

　　→スクレイピングし、記事一覧、検索機能を可能にした。

・友達が、「神回をまとめたい」と言っていた

　　→放送に対して、いいね機能をつけることで、お気に入りの放送をブックマークできる
  
・上記２つの課題を満たした上で、コメント機能やフォロー機能などつけ、ファンが集まるプラットフォームを目指す。

・自分がTwitterのファンアカウントを持っているので、フォロワーおよびファン界隈にリーチできる




## 機能

・スクレイピングしたものを表示、ページネーション機能

・放送日のインクリメンタルサーチ

・いいね機能・一覧表示

・放送に対してのコメント機能

・Userのログイン、ログアウト、サインアップ（devise）

・Twitterでのログイン

・Userのフォロー機能

・Userのアイコン画像、プロフィール欄を追加

・レスポンシブ化



<img width="600" alt="2019-02-28 20 40 34" src="https://user-images.githubusercontent.com/42834409/53564070-37941f00-3b99-11e9-8d7e-67dc2585ce60.png">


<img width="600" alt="2019-02-28 20 42 52" src="https://user-images.githubusercontent.com/42834409/53564150-71652580-3b99-11e9-8f14-011ba0679ba9.png">


<img width="600" alt="スクリーンショット 2019-03-18 21 26 33" src="https://user-images.githubusercontent.com/42834409/54530107-35b5c280-49c5-11e9-81ea-d89649e67733.png">



<img width="600" alt="2019-03-05 16 40 34" src="https://user-images.githubusercontent.com/42834409/53788534-780ee680-3f65-11e9-83b6-7070573d06b9.png">

## 苦労した点

・スクレイピングがうまくDBに保存されなかった

・herokuでのデプロイ時のプリコンパイルが通らなかった

・userのフォロー機能の実装

・TwitterのコールバックURLの設定を忘れてた


## 改善点

・ユーザー検索機能

　　→多分すぐできる（userのnameにindex貼って、インクリメンタルサーチ）


・放送に対するいいね機能のボタンをもっと目立たせる

→ラジオ聞いてる友人に使い心地を聞いたところ、いいね機能があまり目立っていないようだった

・（アプリの説明ページを作る）

→前述の友人曰く、一目で使い方は理解できたようなので不要かも。ただ、作って損はない。

・Twitter上のファンにgoogle formでアンケートとる

→google formなら匿名のため率直な意見が聞ける　+　ゼミで使ったことある

→Twitterのファンに使ってもらうことを想定してるので、ターゲット層の声を聞いてトライアンドエラー

→アンケート設計がめちゃくちゃ大事になるので、就活が落ち着いたらやりたい
