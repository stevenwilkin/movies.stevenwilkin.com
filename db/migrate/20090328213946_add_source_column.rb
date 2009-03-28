# add a 'source' column to the movies table
class AddSourceColumn < ActiveRecord::Migration
  def self.up
    add_column :movies, :source, :integer, :default => 0
  end

  def self.down
    remove_column :movies, :source
  end
end
