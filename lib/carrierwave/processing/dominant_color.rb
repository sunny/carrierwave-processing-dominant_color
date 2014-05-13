require "carrierwave/processing/dominant_color/version"
require "miro"

Miro.options[:color_count] = 1

module CarrierWave
  module Processing
    module DominantColor
      def store_dominant_color
        colors = Miro::DominantColors.new(current_path).to_hex
        model.send("dominant_color_#{mounted_as}=", colors.first)
      end
    end
  end
end
