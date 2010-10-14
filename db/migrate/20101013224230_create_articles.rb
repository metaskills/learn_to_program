class CreateArticles < ActiveRecord::Migration

  def self.up
    # create_table :articles do |t|
    #   t.string :title
    #   t.string :body
    #   t.timestamps
    # end
    add_column :articles :author_id
    
  end

  def self.down
    drop_table :articles
  end

end
