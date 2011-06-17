module Color
  SoundPlayer = '/usr/bin/afplay'

  class << self
    alias_method :orig_color, :color

    def color(color)
     Thread.new {
        case color
          when :green  then play_sound('smb_coin')
          when :yellow then play_sound('smb_bump')
          when :red    then play_sound('smb_bowserfalls')
        end
      }
      orig_color(color)
    end

    def play_sound(sound)
      path = File.expand_path("../../sounds/#{sound}.wav", __FILE__)
      system(SoundPlayer, path)
    end
  end
end
