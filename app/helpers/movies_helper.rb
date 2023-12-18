# frozen_string_literal: true

module MoviesHelper
  def generate_stars(rating)
    full_stars = Integer(rating)
    half_star = (rating % 1).round(1)

    stars = ''

    full_stars.times { stars += '<i class="fa-solid fa-star" style="color: #e8cb26;"></i>' }

    stars += '<i class="fa-solid fa-star-half-stroke" style="color: #e8cb26;"></i>' if half_star.positive?

    sanitize(stars, attributes: %w[class style])
  end
end
