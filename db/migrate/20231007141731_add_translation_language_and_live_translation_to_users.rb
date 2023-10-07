class AddTranslationLanguageAndLiveTranslationToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :translation_language, :string, default: 'en'
    add_column :users, :live_translation, :boolean, default: true
  end
end
