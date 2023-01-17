require 'spec_helper'

describe MusicAlbum do
  context 'Class after receiving arguments' do
    before :each do
      @music_album = MusicAlbum.new('2020-01-01', on_spotify: true)
    end

    it 'should inherit from the Item class' do
      expect(described_class.superclass).to be Item
    end

    it 'should return the spotify status correctly' do
      expect(@music_album.on_spotify).to eq true
    end
  end
end
