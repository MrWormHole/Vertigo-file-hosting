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

  def human_readable_file_size_from_gb(gigabytes)
    bytes = gigabytes * 10 ** 9
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

  def get_total_file_sizes_in_use(attachments, returnBytesWithoutLetter)
    total = 0
    
    attachments.each do |a|
      size = a.file.blob.byte_size
      total += size
    end

    if returnBytesWithoutLetter
      return total
    end

    res = human_readable_file_size(total)
    if res != nil
      return res
    end

    return "total file sizes couldn't be determined"
  end

  def get_user_selected_plan_to_file_size(plan)
    case plan
    when "FREE"
      return 5  * 10 ** 9
    when "PREMIUM"
      return 100 * 10 ** 9
    when "PRO"
      return 1 * 10 ** 12
    when "ENTERPRISE"
      return "unlimited"
    end
  end

  def total_percentage_of_used_space(attachments,plan)
    in_use = get_total_file_sizes_in_use(attachments,true) * 1.0
    total_capacity = get_user_selected_plan_to_file_size(plan)

    res = (((in_use / total_capacity) * 100).round)
    return res 
  end

  def total_percentage_of_non_used_space(attachments,plan)
    res = total_percentage_of_used_space(attachments,plan)
    return 100 - res
  end

end
