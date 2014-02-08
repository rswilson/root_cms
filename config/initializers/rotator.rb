module Paperclip  
  class Rotator < Thumbnail  
    def transformation_command  
      if rotate_command
        original_command = super
        if original_command.include?('-crop')
          original_command.delete_at(super.index('-crop') + 1)
          original_command.delete_at(super.index('-crop'))
        end
        rotate_command + original_command
      else  
        super  
      end  
    end  

    def rotate_command  
      target = @attachment.instance  
      if target.rotating?
        ["-rotate", "#{target.rotation}"]
      end  
    end  
  end  
end