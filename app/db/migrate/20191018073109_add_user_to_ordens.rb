class AddUserToOrdens < ActiveRecord::Migration[5.2]
  def change
    add_reference :ordens, :user, foreign_key: true
  end
end
