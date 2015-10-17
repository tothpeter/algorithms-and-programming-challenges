require './lru_cache'

class LRUCache
  attr_accessor :keymap, :head, :tail
end

describe LRUCache do
  describe '#get' do
    it 'returns the required item' do
      cache = LRUCache.new 10

      cache.add "user_name", "Kalina Tech"
      cache.add "user_name2", "Kalina Tech2"

      expect(cache.get("user_name")).to eq "Kalina Tech"
    end

    it 'returns nil (cache miss)' do
      cache = LRUCache.new 10

      cache.add "user_name", "Kalina Tech"
      cache.add "user_name2", "Kalina Tech2"

      expect(cache.get("user_name3")).to eq nil
    end

    it 'makes the required item the last used one' do
      cache = LRUCache.new 3

      cache.add "user_name", "Kalina Tech"
      cache.add "user_name2", "Kalina Tech2"
      cache.add "user_name3", "Kalina Tech3"

      cache.get "user_name2"

      expect(cache.head.value).to eq "Kalina Tech2"
      expect(cache.head.older.value).to eq "Kalina Tech3"
      expect(cache.tail.value).to eq "Kalina Tech"
    end
  end

  describe '#add' do
    it 'discards the last used' do
      cache = LRUCache.new 2

      cache.add "user_name", "Kalina Tech"
      cache.add "user_name2", "Kalina Tech2"
      cache.add "user_name3", "Kalina Tech3"

      expect(cache.tail.value).to eq "Kalina Tech2"
      expect(cache.tail.newer.value).to eq "Kalina Tech3"
      expect(cache.keymap.length).to eq 2
    end
  end
end