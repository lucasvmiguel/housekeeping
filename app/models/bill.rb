class Bill < ApplicationRecord
    belongs_to :user, required: true
end
