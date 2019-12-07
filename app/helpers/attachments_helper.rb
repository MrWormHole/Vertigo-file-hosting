module AttachmentsHelper
    def get_file_size(attachment = @attachment)
        file_size = attachment.file.blob.byte_size
        
        if file_size < 1000
          return "#{file_size} KB"
        elsif file_size < 1000 ** 2
          return "#{(file_size/1000.0 * 10).round / 10.0} MB"
        elsif file_size < 1000 ** 3
          return "#{((file_size/1000.0 ** 2) * 10).round / 10.0} GB"
        end
    
        return "file size couldn't be determined"
      end
end
