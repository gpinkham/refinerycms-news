class AddTypeToNewsItems < ActiveRecord::Migration
  def self.up
      add_column ::NewsItem.table_name, :item_type, :string
  end

  def self.down
      remove_column ::NewsItem.table_name, :item_type
  end
end
