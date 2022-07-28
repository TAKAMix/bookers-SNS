class Book < ApplicationRecord
  belongs_to :user
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  #コメント機能のアソシエーション
  has_many :book_comments, dependent: :destroy
  
  
end
