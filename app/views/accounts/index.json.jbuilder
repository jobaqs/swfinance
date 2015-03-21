json.array!(@accounts) do |account|
  json.extract! account, :id, :account_number, :account_name, :user_id
  json.url account_url(account, format: :json)
end
