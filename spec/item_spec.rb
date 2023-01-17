require_relative '../modules/item'

RSpec.describe Item do
  context 'can_be_archived?' do
    it 'shoud return false' do
      result = Item.new('2022/01/01', true)
      expect(result.can_be_archived?).to be false
    end

    it 'shoud return true' do
      result = Item.new('2012/01/01', true)
      expect(result.can_be_archived?).to be true
    end
  end

  context 'move_to_archive' do
    it 'should return true' do
      result = Item.new('2012/01/01', true)
      expect(result.move_to_archive?).to be true
    end

    it 'should return true or false' do
      result = Item.new('2022/01/01', true)
      expect(result.move_to_archive?).to be nil
    end
  end
end
