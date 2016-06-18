module SlackMessenger
  class Attachment
    def initialize(options = {})
      @fallback = options[:fallback]
      @color = options[:color] || '#36a64f'
      @pretext = options[:pretext]
      @author_name = options[:author_name]
      @author_link = options[:author_link]
      @author_icon = options[:author_icon]
      @title = options[:title]
      @title_link = options[:title_link]
      @text = options[:text] || ""
      @fields = options[:fields] || []
      @image_url = options[:image_url]
      @thumb_url = options[:thumb_url]
      @footer = options[:footer]
      @footer_icon = options[:footer_icon]
      @ts = options[:ts] || false
    end

    def as_json
      hash = {}
      hash[:fallback] = @fallback unless @fallback.nil?
      hash[:color] = @color
      hash[:pretext] = @pretext unless @pretext.nil?
      hash[:author_name] = @author_name unless @author_name.nil?
      hash[:author_link] = @author_name unless @author_link.nil?
      hash[:author_icon] = @author_icon unless @author_icon.nil?
      hash[:title] = @title unless @title.nil?
      hash[:title_link] = @title_link unless @title_link.nil?
      hash[:text] = @text unless @text.nil?
      hash[:fields] = @fields.map(&:as_json) unless @fields.nil? || @fields.empty?
      hash[:image_url] = @image_url unless @image_url.nil?
      hash[:thumb_url] = @thumb_url unless @thumb_url.nil?
      hash[:footer] = @footer unless @footer.nil?
      hash[:footer_icon] = @footer_icon unless @footer_icon.nil?
      hash[:ts] = Time.now.to_i if @ts

      hash
    end
  end
end
