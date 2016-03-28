class Post < ActiveRecord::Base
  
  
  rails_admin do
    edit do
      field :title
      field :user_id
      field :body, :rich_editor do
           config({
             :insert_many => true
           })
       end
    end
  end
end


