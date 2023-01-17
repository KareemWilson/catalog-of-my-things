require 'spec_helper'

describe Genre do
  context 'class after recieving arguments' do
    before :each do
      @label = 'Rap'
      @genre = Genre.new(@label)
    end

    it 'should be an instance of Genre class' do
      expect(@genre).to be_instance_of Genre
    end

    it 'should have an instance variable items which is an array' do
      expect(@genre.items).to be_instance_of Array
    end

    it 'should correctly return the name of the genre' do
      expect(@genre.name).to eq @label
    end

    describe '#add_item' do
      it 'should correctly add an item' do
        item = Item.new('2022/01/01', true)
        @genre.add_item(item)
        expect(@genre.items).to eq([item])
      end
    end
  end
end
