class SlotMachine
  SYMBOLS = ["cherry", "seven", "bell", "star", "joker"]

  def initialize(reels)
    @reels = reels
  end

  def score
    return base_score * 10 if @reels.uniq.size == 1

    if @reels.uniq.size == 2 && (@reels.sort[1] == "joker" || @reels.include?("joker"))
      return base_score * 5
    end

    return 0
  end

  private

  # cherry bell cherry => bell cherry cherry
  # bell joker bell => bell bell joker
  def base_score
    SYMBOLS.index(@reels.sort[1]) + 1
  end
end
