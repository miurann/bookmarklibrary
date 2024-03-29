# [ブクマ図書館]

## サービス概要
サイトのURLを登録することでブックマークを管理するサービスです。  
ブックマークを登録すると本棚に本が増えます。
タグやキーワード検索で見つけやすく、見た目にも楽しく管理ができます。  

## 想定されるユーザー層
参考にしたサイトに再びアクセスしたいプログラミング学習者  
その他独自のタグ付けでブックマークを整理し再アクセスしやすくしたい人  
本棚を眺めるのが好きな人  

## サービスコンセプト
*見た目も楽しいブックマークマネージャー*  

プログラミング学習中、参考にしたサイトをブラウザのブックマークに入れていても、  
再びアクセスしたい時にブックマーク名だけではどのサイトだったか分からず  
探すのに時間がかかった自分自身の体験から、ブックマークをタグやキーワード検索で  
わかりやすく分類すれば効率的と考えました。  
また、本棚に本が並ぶことで視覚的にも楽しく、  
すぐにアクセスしたいサイトは表紙をこちらに向ける面出しの表示にすることで  
クイックアクセスも可能にします。(本リリースまでに実装予定)  


＜本リリースまでの予定ER図＞  
<img width="798" alt="スクリーンショット 2024-02-05 4 58 29" src="https://github.com/miurann/bookmarklibrary/assets/96119509/b0cd3c13-457f-4cb0-92fa-24a47033e9da">  

## 実装を予定している機能
### MVP
* 会員登録  
* ログイン  
* ブックマーク登録  
* ブックマーク編集・削除  
* ブックマーク一覧  
* ブックマークキーワード検索  
* ブックマーク検索結果にブックマーク内容を追加で表示  

### 本リリースまでに予定している機能
* ブックマークタグ登録・編集・削除
* ブックマーク表示画像の種類を増やし選択可能にする
* お問い合わせフォーム
* ユーザー登録情報の修正、削除、パスワードリセット
* ファビコン

### その後の機能
* ブックマーク一覧の並べ替え
* ブックマーク画像にファビコンを表示
* ブックマークフォルダ
* ブックマークフォルダの入れ子
* ブックマーク・フォルダの共有
* google検索窓
