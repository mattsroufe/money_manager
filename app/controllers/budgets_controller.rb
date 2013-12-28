class BudgetsController < ApplicationController
  def show
    months = []
    for i in 0..11 do
      months << (Time.now - i.month).strftime('%b')
    end
    @months = months.reverse
  end
end
