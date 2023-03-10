# README

## アプリケーション名
AiLustRation

## アプリケーションの概要
当アプリケーションではAIで作成したイラストや小説の投稿や販売が可能です。  

ユーザーはイラストや小説を投稿することができ、商品を出品することもできます。

投稿した内容は詳細ページで編集・削除することが可能です。  

投稿者及び出品者以外のユーザーは作品に対しコメントをつけることができ、商品を購入することもできます。

## URL
https://ailustration.onrender.com/

*Renderの仕様上DBが休止もしくは24時間経過すると投稿イメージが削除されます。*  
  
検索機能及びページネーションの確認のため、小説を複数投稿しております。


## テストアカウント

### Basic認証
ID : ailustration  
password : 1ailusdply9  

### 投稿・出品用アカウント
メールアドレス：ailus1@ailus2  
パスワード：1wnekkud9  
### 閲覧・購入用アカウント
メールアドレス：ailus2@ailus2  
パスワード：1wnebkud0  
購入用カード番号： 4242424242424242  
購入用カード有効期限： 現在よりも先の日付  
購入用カードCVC： 123

## 利用方法  
  
### ログイン
①画面右上のログインボタンをクリック  
②フォームにメールアドレスとパスワードを入力  
③ログインボタンをクリック  
### 投稿の閲覧
①投稿ページなどにいる場合には左上のロゴをクリックしトップページへ遷移  
②検索フォームの下にあるメニューよりイラスト・小説・商品を切り替えることで一覧画面へ遷移  
③投稿内容のサムネイルをクリックすることで詳細ページに遷移可能です。  
### 投稿の検索
①画面上部の検索フォームに検索キーワードを入力し検索ボタンをクリック。  
②キーワードを適用した検索結果ページへ遷移します。   
③また、検索結果ページでイラストタグなどをクリックすることで同様のキーワードの検索結果を表示します。  
### イラストの投稿
①画面上部の投稿・出品ボタンをクリック  
②プルダウンメニューから「イラストを投稿する」を選択  
②画像を添付しフォームに記入(複数投稿可能)  
③下部にある送信ボタンをクリック  
④投稿に成功すると投稿したイラストの詳細ページに遷移します。  
### 小説の投稿
①画面上部の投稿・出品ボタンをクリック  
②プルダウンメニューから「小説を投稿する」を選択  
②フォームに内容を記入(文字、画像、文字、画像といった形式の投稿も可)  
③下部にある送信ボタンをクリック  
④投稿に成功すると投稿した小説の詳細ページに遷移します。  
### 商品
①画面上部の投稿・出品ボタンをクリック  
②プルダウンメニューから「商品を出品する」を選択  
②画像を添付しフォームに記入(複数投稿可能)  
③下部にある送信ボタンをクリック  
④投稿に成功すると投稿した商品の詳細ページに遷移します。  
### 編集方法
①編集したい投稿の詳細ページへ移動します。  
②詳細ページより編集ボタンをクリック(投稿者とログインユーザーが同一時のみ表示)  
③フォームを編集し、下部の送信ボタンをクリックします。  
④編集が適用された詳細ページ遷移します。  
### 削除方法
①削除したい投稿の詳細ページへ移動します。  
②詳細ページより削除ボタンをクリック(投稿者とログインユーザーが同一時のみ表示)   
④削除が完了するとトップページへ遷移します。  


## アプリケーションを作成した背景
AIによりイラストの作成ができるようになり、著作権やアーティストへの配慮など様々な問題が生まれました。  
イラスト投稿サイトや、販売サイト、作成ツールにおいてもAIイラストの利用や生成機能に対して反発する者が多いのが現状です。  

上記のような問題があるためアプリケーションとして運用するには、
既存の投稿アプリケーションや販売アプリケーションとは切り離して考える必要性を感じました。  
既存のサービスに＋する形で運用した場合には
自ら作品を生み出す作家たちのモチベーションを下げることにつながりかねなません。  
結果として作家の生産性が下がり、その作家に紐づくファンによる利益が下がると考えます。  
また、私自身が委託業務でイラストに携わる仕事をしていた過去があり、AI作品と人の手によって作られた作品が混在する現状を好ましく思っていないという心情もあります。  

故に既存サービスとは切り分ける形で当アプリケーションのような独立した投稿、販売アプリケーションが必要であると考えました。



## 洗い出した要件
https://docs.google.com/spreadsheets/d/1opleU7nk15x4F8SA540GCDqZ6mvnBzv-dsPZgWEwJuU

## 実装した機能についての画像やGIFおよびその説明
 
## 実装予定の機能
カート機能やコメント機能。  
また、タグ機能を実装予定です。  
不適切な投稿の通報機能も必要だと考えています。  
商品の削除に関しては、削除ボタンを押すと管理者に削除要請メールが届く仕様にする必要もあると考えます。  
ユーザーによる削除を可能にしてしまうと購入者に不利益が生じるためです。
ユーザーモデルのテストにおいてcustom validationをテストしなければならないので
mockの作成を検討しています。

## データベース設計
[![Image from Gyazo](https://i.gyazo.com/531cfa46bd02eb4845754fc67381a69a.png)](https://gyazo.com/531cfa46bd02eb4845754fc67381a69a)
同アプリケーションファイル内「DataBaseArchitecture」

## 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/f2f454b6081a4fb4753eec939027a6d1.png)](https://gyazo.com/f2f454b6081a4fb4753eec939027a6d1)
同アプリケーションファイル内「screenTransitionDiagram」  
## 開発環境
 Ruby Ruby_on_Rails JavaScript mySQL postgreSQL Render
## ローカルでの動作方法
 
## 工夫したポイント
小説投稿の際にはユーザーが小説の任意の箇所に画像を挿入できるようにするために、
リッチテストフォームを実装いたしました。
railsのgemであるActionTextを用いて実装しています。 
当初は小説投稿機能を作成する予定はなかったのですが、
chatGPTなどのAIによる文章の作成が活性化していたため実装いたしました。  

トップページは使いやすいようにイラスト・小説・商品でカテゴリを分け、
上部に切り替えタグを設置しました。

検索結果においては多数の投稿を扱うため、ページネーション機能を実装いたしました。
また、利便性を考え検索結果の表示画面では上部のタグでイラスト・小説・商品を切り替えると
検索条件を保持したまま各検索結果ページへ遷移するようにしました。

## 苦労したポイント
ログインしているユーザーが特定の商品を購入したか否かの分岐の設定に苦労しました。  
ユーザーは購入した商品をダウンロードできる仕様であるため、上記条件分岐が必須となりました。  

初めは商品に紐づく購入情報を取得使用としたのですが、これだと購入情報の外部キーを商品の投稿ユーザーのidで探してしまい、上手く取得することができませんでした。

パラメータを見ていて外部キーの指定に問題があると気がつき、特定のレコードを取得する記述を行いました。  
内容としては、ログインしているユーザーのidと商品詳細ページの商品idをキーとして両方に一致する外部キーを持つ購入情報のレコードを取得する記述を行いました。

結果として想定する動作結果を得ることができました。  