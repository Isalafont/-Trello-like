# frozen_string_literal: true

class Card < ApplicationRecord
  acts_as_list scope: :list

  belongs_to :list

  validates :title, presence: true
end
