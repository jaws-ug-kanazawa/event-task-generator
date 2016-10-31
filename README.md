# これは何か

JAWS-UG 金沢 はイベントの開催タスクの管理に GitHub issue を使っています。

イベント開催毎に定期的に必用な GitHub issue を作成してくれるツールです。

# 使い方

## 最初のセットアップ

``` shell
$ mkdir jaws-ug-kanazawa-event-task-generator
$ cd jaws-ug-kanazawa-event-task-generator
$ git clone https://github.com/jaws-ug-kanazawa/event-task-generator.git .
$ cp .env.sample .env 
$ vim .env # GitHub の アクセストークンなど設定してください
$ bundle install --path vendor/bundle
```

## 運用

毎回イベントのたびに `commit` してもらったほうが歴史が残されていいかなと考えています。でも `task.yml` は管理しないほうがアプリとしての汎用度は高いかなあ。

``` shell
$ git pull
$ vim task.yml # 最新版のイベントにあわせてタイトルなど更新
$ bundle exec ruby main.rb task.yml
$ git add task.yml # 最新版のを残しておくことでバージョン管理できるかなって
$ git commit -m '第x回のイベント'
$ git push origin master

```


# バグとTODO

- 同名のissueがあったら更新なのかキャンセルなのか問い合わせしたい
- thor あたりで CLI ツールとしたい
- GEM 化したい
