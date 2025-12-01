class ChangeTitleNotNullOnBookmark < ActiveRecord::Migration[7.1]
  def change
    change_column_null :bookmarks, :title, false
  end
end
