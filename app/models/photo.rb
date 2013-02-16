class Photo
  attr_accessor :url, :width, :height
  def initialize(attrs)
    low_res = attrs[:images][:low_resolution]

    @url = low_res[:url]
    @width = low_res[:width]
    @height = low_res[:height]
  end

  def self.recent(&block)
    AFMotion::Client.shared.get('media/popular?', client_id: INSTAGRAM_CLIENT_ID) do |result|
      if result.success?
        json = result.object
        photos = json['data'].map{|item| Photo.new(item)}
        block.call(photos)
      else
       #something went wrong
       # raise result.error.localizedDescription
      end
    end
  end
end
