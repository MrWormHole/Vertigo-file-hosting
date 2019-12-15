module AttachmentsHelper
  def human_readable_file_size(bytes)
    if bytes < 1000
      return "#{bytes} B"
    elsif bytes < 1000 ** 2
      return "#{(bytes/1000.0 * 10).round / 10.0} KB"
    elsif bytes < 1000 ** 3
      return "#{((bytes/1000.0 ** 2) * 10).round / 10.0} MB"
    elsif bytes < 1000 ** 4
      return "#{(bytes/1000.0 * 10).round / 10.0} GB"
    end
  end

  def get_file_size(attachment)
      file_size = attachment.file.blob.byte_size
      
      res = human_readable_file_size(file_size)
      if res != nil
        return res
      end
  
      return "file size couldn't be determined"
  end

  def get_total_file_sizes(attachments)
    total = 0
    
    attachments.each do |a|
      size = a.file.blob.byte_size
      total += size
    end

    res = human_readable_file_size(total)
    if res != nil
      return res
    end

    return "total file sizes couldn't be determined"
  end

end
