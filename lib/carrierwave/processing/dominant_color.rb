require "carrierwave/processing/dominant_color/version"

module CarrierWave
  module Processing
    module DominantColor
      def store_dominant_color
        color = Miro::DominantColors.new(current_path)
        model.dominant_color = color.to_hex.first
        raise model.dominant_color.inspect
      end
    end
  end
end
