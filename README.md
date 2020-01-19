# dlg_profile

## ローカル環境構築
`bash rails5.sh`
でできるようになってます。

やってることは、mysqlとrubyの公式イメージを取ってきて、
buildしたのち、Gemfileからgemを取得。

databaseをcreateしています。
migrateはしていないので、自分でしてください。

### ローカルのDB

```
rails db:create
rails db:migrate
rails db:seed_fu
```

`mysql -u root -p -h localhost -P 3306 --protocol=tcp`


### Rails App

```
docker-compose run web bundle install
rails s
```

### Redis
```
brew install redis
redis-server
```

### Sidekiq

`bundle exec sidekiq`


### モデル・コントローラの作成

```
$ rails g model user name:string email:string
$ rails g controller user
$ rails db:migrate
```

### routing versions

```rb:config/routes.rb
Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :posts
    end
  end
end
```

`rails routes`で確認できます。

## 本番環境のデプロイ

インフラに関係するファイルもレポジトリがないのでここにいれておきます。
将来的にレポジトリを分ける可能性はありです。

```
$ gcloud app deploy
$ bundle exec rake appengine:exec -- bundle exec rake db:migrate
```

でデプロイできます。
これ以上にGAEのことについての知識はないです笑

## 本番のログ

google-fluentdがあるので、基本はstackdriverで見れます。

`gcloud app logs read`でも確認できます。


## cloud-sqlとの連携
app.yamlとconfig/database.ymlに依存しています。

