json.extract! bill, :id, :name, :user_id, :when_payed, :amount, :created_at, :updated_at
json.url bill_url(bill, format: :json)