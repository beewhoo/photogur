class AddPictureIdToComments < ActiveRecord::Migration[5.0]
  def change
      change_table :comments do |t|
        t.integer "picture_id"
      end
    end
  end
