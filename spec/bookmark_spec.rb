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

      expect(bookmarks).to include(["http://www.makersacademy.com", 'Makers'])
      expect(bookmarks).to include(["http://www.twitter.com", 'Twitter'])
      expect(bookmarks).to include(["http://www.github.com", 'Github'])
    end
  end
end
