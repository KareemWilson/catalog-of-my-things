require_relative '../modules/game'

describe Game do
  context 'When Using can_be_archived? method' do
    it "should return true if parent's method returns true AND if last_played_at is older than 2 years" do
      game = Game.new('2012-11-01', true, 'test', '2020-12-12')
      expect(game.can_be_archived?).to be true
    end
    it "should return false if parent's method returns false" do
      game = Game.new('2017-11-01', true, 'test', '2019-12-12')
      expect(game.can_be_archived?).to be false
    end
    it 'should return false if last_played_at is older than 2 years' do
      game = Game.new('2012-11-01', true, 'test', '2021-12-12')
      expect(game.can_be_archived?).to be false
    end
  end
end
