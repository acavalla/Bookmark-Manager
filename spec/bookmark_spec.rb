# frozen_string_literal: true

require './lib/bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.twitter.com', 'Twitter');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.github.com', 'Github');")

      bookmarks = Bookmark.all

      expect(bookmarks[0].title).to eq 'Makers'
      expect(bookmarks[1].url).to eq('http://www.twitter.com')
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
  end

  describe '.delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.create(title: "Makers Academy", url: "http://www.makersacademy.com")
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '.update' do 
    it 'updates the bookmark with the given data' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.snakersacademy.com', title: 'Snakers Academy')

    expect(updated_bookmark).to be_a Bookmark
    expect(updated_bookmark.id).to eq bookmark.id
    expect(updated_bookmark.title).to eq 'Snakers Academy'
    expect(updated_bookmark.url).to eq 'http://www.snakersacademy.com'
    end
  end
  
end
