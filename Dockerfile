FROM ruby:3.2

# 必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    yarn

# アプリケーションディレクトリを作成
ENV APP_PATH /app
RUN mkdir $APP_PATH
WORKDIR $APP_PATH

# Gemfile をコピーして bundle install
COPY Gemfile Gemfile.lock $APP_PATH/
RUN bundle install

# アプリケーションファイルをコピー
COPY . $APP_PATH

# ポートを公開
EXPOSE 3000

# サーバーを起動
CMD ["rails", "server", "-b", "0.0.0.0"]
