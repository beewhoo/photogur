class AddNameTextToComments < ActiveRecord::Migration[5.0]

  def change
      change_table :comments do |t|
        t.string :name
        t.text   :message
      end
    end
  end
