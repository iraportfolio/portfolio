class HomeController < ApplicationController
  def index
    image_id = Setting.where(env: Rails.env).first&.title_image_id
    @title_image = Image.where(id: image_id).first if image_id.to_i > 0
    @title_image = Photo.where(id: image_id).first if @title_image.blank?

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
