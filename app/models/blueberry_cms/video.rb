module BlueberryCMS
  class Video
    include Mongoid::Document
    include MongoidEnumerable

    field :job,       type: String
    field :movie_url, type: String
    field :position,  type: Integer
    field :title,     type: String, localize: true
    field :video_id,  type: String

    enumerable :channel, %i[youtube vimeo]

    embedded_in :vide_gallery, class_name: 'BlueberryCMS::PageBlocks::VideoGallery'

    YOUTUBE_REGEX = /https?:\/\/(?:www\.)?(?:youtu\.be\/|youtube\.com\S*[^\w\-\s])([\w\-]{11})(?=[^\w\-]|$)(?![?=&+%\w.\-]*(?:['"][^<>]*>|<\/a>))[?=&+%\w.-]*/i
    VIMEO_REGEX = /(http|https)?:\/\/(www\.)?vimeo.com\/(?:channels\/(?:\w+\/)?|groups\/([^\/]*)\/videos\/|)(\d+)(?:|\/\?)/i

    validates :movie_url, presence: true

    before_save :setup_fields

    def watch_link
      if youtube?
        "https://www.youtube.com/watch?v=#{video_id}&autoplay=1&rel=0"
      elsif vimeo?
        "https://vimeo.com/#{video_id}"
      end
    end

    def embed_link
      if youtube?
        "https://www.youtube.com/embed/#{video_id}?rel=0"
      elsif vimeo?
        "https://vimeo.com/#{video_id}"
      end
    end

    def preview_url
      if youtube?
        "https://img.youtube.com/vi/#{video_id}/mqdefault.jpg"
      elsif vimeo?
        Vimeo::Simple::Video.info(video_id).first['thumbnail_large']
      end
    end

    private

    def vimeo_id
      movie_url.scan(VIMEO_REGEX).flatten.compact.last
    end

    def youtube_id
      movie_url.scan(YOUTUBE_REGEX).flatten.compact.last
    end

    def detect_source
      if youtube_id
        :youtube
      elsif vimeo_id
        :vimeo
      end
    end

    def setup_fields
      self.video_id = youtube_id || vimeo_id
      self.channel  = detect_source
    end
  end
end
