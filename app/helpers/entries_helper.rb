module EntriesHelper


  def media_height(entry)
    if entry.movie
      500
    else
      media_width(entry)
    end
  end
  
  def media_width(entry)
      case 
      when entry.movie && entry.movie.width
        entry.movie.width
      when entry.picture.nil? || entry.picture.width > 600
        600
      when entry.picture.width < 300
        300
      else 
        entry.picture.width
      end
  end
  
  def display_picture(entry)
    if entry.picture
      if (entry.picture.width || 0) > 600
    		image_tag(entry.picture.picturefile.url(:full))
    	else
    		image_tag(entry.picture.picturefile.url(:original))
    	end
    end
  end
end
