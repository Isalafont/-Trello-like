class Attachment < ApplicationRecord
  has_one_attached :image

  def image_compressed
    if image.attached?
      image.variant(resize_to_fit: [700, 600]).processed
    end
  end
end
