class CreateBarbers < ActiveRecord::Migration
  def change
    create_table :barbers do |t|
      t.text :name

      t.timestamps null: false
    end

    Barber.create :name=> "Jassie Pinkman"

    Barber.create :name=> "Walter Wailt"


    Barber.create :name=> "Gus Fring"
  end
end
