![medpod_logo_lg](https://user-images.githubusercontent.com/66853444/110793416-efe01c00-82b7-11eb-857a-bd48405efc73.png)
<img width="100%" alt="ss_top" src="https://user-images.githubusercontent.com/66853444/110795247-f7a0c000-82b9-11eb-985a-744c70ee2290.png">

Medpodは医療・介護職の方と企業・法人を繋ぐアルバイトのマッチングサービスです。

:globe_with_meridians: [heroku Pages](https://glacial-falls-70520.herokuapp.com/)  
<br><br>

# 概要

サインインしたユーザーは  
1. マイプロフィールの作成  
2. 求人情報の作成 
3. 求人情報の検索・閲覧
4. mailerを使った求人への応募  

機能が使用できます。その他の機能として、お気に入り機能や求人へのレビュー機能があります。  

**※サインアップなしでもゲストログイン機能がございます。**  

<img width="100%" alt="ss_login" src="https://user-images.githubusercontent.com/66853444/110798648-bb6f5e80-82bd-11eb-9ddf-1eb2876f916f.png">  
<br><br><br>

# 使用技術

<img width="100%" alt="ss_technology" src="https://user-images.githubusercontent.com/66853444/110805768-bfeb4580-82c4-11eb-994e-9b7a193687cf.png">

* Ruby '2.5.3'
* Rails '5.2.4'  
* MySQL2 '0.5.3'  
* PostgreSQL '1.2.3'(production)  

dockerで環境構築を行い、Circle CIでテスト(RSpec)とリンター(rubocop-airbnb)を自動化。デプロイはPaaSのherokuを使用。  
<br><br>

# 機能詳細  
* gem 'devise' を使用したログイン機能
* Twitterログイン機能
* 簡単にログインできるゲストログイン機能
* 郵便番号による住所の自動入力機能
* Maps JavaScript API, Geocoding API を使用したマップの表示
* gem 'ransack' を使用したフリーワード or 都道府県での検索機能
* お気に入り追加・解除(ajax)機能
* 企業・法人の五つ星評価・レビュー機能
* 求人一覧のページネーション機能
* Action Mailerを使用した求人への応募機能
* Google analyticsでの解析
* レスポンシブ対応  
<br><br>

# リレーション  
[ER図.pdf](https://github.com/hip750/my_portfolio/files/6124281/erd.pdf)  
<br><br>

# ライセンス
https://choosealicense.com/licenses/mit/
