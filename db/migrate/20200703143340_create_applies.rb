class CreateApplies < ActiveRecord::Migration[5.2]
  def change
    create_table :applies do |t|
      t.string :message
      t.references :user, foreign_key: true
      t.references :apartment, foreign_key: true

      t.timestamps
    end
  end
end
