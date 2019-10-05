class CreateMovieTrackers < ActiveRecord::Migration
  def change
    create_table :movie_trackers do |t|

      t.timestamps null: false
    end
  end
end
