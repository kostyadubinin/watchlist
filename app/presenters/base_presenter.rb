# frozen_string_literal: true
class BasePresenter
  attr_reader :model, :h

  def initialize(model, h)
    @model = model
    @h = h
  end
end
