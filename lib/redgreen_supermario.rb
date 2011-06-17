module Color
  SoundPlayers = %(afplay play)

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
      system(sound_player, path)
    end

    def sound_player
      @sound_player ||= find_sound_player
    end

    def find_sound_player
      SoundPlayers.find do |player|
        system('which', player)
      end
    end
  end
end
