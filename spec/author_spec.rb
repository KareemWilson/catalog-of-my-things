require_relative '../modules/author'
require_relative '../modules/item'

describe Author do
  author1 = Author.new('George', 'Martin')
  item1 = Item.new('2015-10-22', true)
  context 'when using add_item method' do
    author1.add_item(item1)
    it 'should add self as a property of the item object' do
      expect(item1.author.first_name).to eq 'George'
    end
    it 'should add the input item to the collection of items' do
      expect(author1.items[0]).to eq item1
    end
  end
end
