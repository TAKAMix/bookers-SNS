class BookComment < ApplicationRecord
  
  #コメント機能のアソシエーション
  belongs_to :user
  belongs_to :book
  
end
