DeviseTokenAuth.setup do |config|
  # ヘッダー名の設定
  config.headers_names = {
    'access-token': "access-token",
    'client': "client",
    'expiry': "expiry",
    'uid': "uid",
    'token-type': "token-type"
  }


  # その他の設定（必要に応じて追加）
  config.default_confirm_success_url = "http://localhost:3000"
end
