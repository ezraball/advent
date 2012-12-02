class AddEmbedCodeToMovies < ActiveRecord::Migration
  def change
    remove_column :movies, :youtube_url
    add_column :movies, :embed_code, :text
    add_column :movies, :name, :string
    add_column :movies, :width, :integer
  end
end
