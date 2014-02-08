Paperclip.interpolates :album_id do |attachment, style|
  attachment.instance.album.id
end