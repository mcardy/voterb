class CreatePolls < ActiveRecord::Migration[5.1]
  def change
    create_table :polls do |t|
      t.string :title
      t.text :poll
      t.text :voted

      t.timestamps
    end
  end
end
