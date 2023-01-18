require_relative '../modules/book'

RSpec.describe Book do
  context 'can_be_archived?()' do
    it 'shoud return true' do
      book = Book.new('A', '2012-01-01', true, 'olivier', 'bad')
      expect(book.can_be_archived?).to be true
    end

    it 'shoud return true' do
      book = Book.new('A', '2022-01-01', true, 'olivier', 'bad')
      expect(book.can_be_archived?).to be true
    end

    it 'shoud return false' do
      book = Book.new('A', '2022-01-01', true, 'olivier', 'good')
      expect(book.can_be_archived?).to be false
    end
  end
end