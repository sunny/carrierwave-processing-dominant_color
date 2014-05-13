require "carrierwave/processing/dominant_color/version"
require "miro"

Miro.options[:color_count] = 1

module CarrierWave
  module Processing
    module DominantColor
      def store_dominant_color
        color = Miro::DominantColors.new(current_path)
        model.dominant_color = color.to_hex.first
      end
    end
  end
end
