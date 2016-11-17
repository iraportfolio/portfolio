class HomeController < ApplicationController
  def index
    @title_image = Image.where(id: ENV['TITLE_IMAGE_ID']).first if ENV['TITLE_IMAGE_ID'].present?
    @title_image = Photo.where(id: ENV['TITLE_IMAGE_ID']).first if @title_image.blank?

    album = Album.where(title: 'Portrait').first
    @link = album_path(album) if album

    render layout: nil
  end

  def contacts
  end

  def rss
    @rss_records = RssRecord.order('updated_at DESC').limit(20)

    respond_to do |format|
      format.rss { render layout: false }
    end
  end
end
