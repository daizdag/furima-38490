# capistranoのバージョンを記載。固定のバージョンを利用し続け、バージョン変更によるトラブルを防止する
# 「Capistranoのバージョン」は、Gemfile.lockに記載されています
lock '3.17.1'

# Capistranoのログの表示に利用する
set :application, 'furima-38490'

# どのリポジトリからアプリをpullするかを指定する
set :repo_url,  'git@github.com:daizdag/furima-38490.git'

# バージョンが変わっても共通で参照するディレクトリを指定
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.6.5' #カリキュラム通りに進めた場合、’2.6.5’ です

# どの公開鍵を利用してデプロイするか
set :ssh_options, auth_methods: ['publickey'],
                                  keys: ['~/.ssh/daizedamame.pem'] 

# プロセス番号を記載したファイルの場所
# バージョンが変わっても共通で参照されるディレクトリが格納されるディレクトリ(log、public、tmp、vendor)
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

# Unicornの設定ファイルの場所
# 「currentディレクトリ」には、releasesフォルダの中で一番新しいものが自動的にコピーされているような状態に
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
# 今回は5つ、過去のバージョンを保存するよう設定
set :keep_releases, 5

# デプロイ処理が終わった後、Unicornを再起動するための記述
after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end