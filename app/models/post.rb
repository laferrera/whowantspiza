class Post < ActiveRecord::Base
  belongs_to :user
  
  rails_admin do
    edit do
      field :title
      field :user
      field :grid_image_id, :rich_picker do
        formatted_value{ bindings[:object].id }
      end
      field :body, :rich_editor do
           config({
             :insert_many => true
           })
       end
    end
  end
end


