module SlackMessenger
  class Attachment
    def initialize(options = {})
      @fallback = options.fetch :fallback
      @color = options.fetch :color, '#36a64f'
      @pretext = options.fetch :pretext
      @author_name = options.fetch :author_name
      @author_link = options.fetch :author_link
      @author_icon = options.fetch :author_icon
      @title = options.fetch :title
      @title_link = options.fetch :title_link
      @text = options.fetch :text, ""
      @fields = options.fetch :fields, {}
      @image_url = options.fetch :image_url
      @thumb_url = options.fetch :thumb_url
      @footer = options.fetch :footer
      @footer_icon = options.fetch :footer_icon
      @ts = DateTime.now unless options[:ts]
    end

    def as_json
      hash = {}
      hash[:fallback] = @fallback unless @fallback.nil?
      hash[:options] = @color
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
      hash[:ts] = @ts unless @ts.nil?

      hash
    end
  end
end
