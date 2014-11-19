module Art
  module Banners
    def self.intro_message
      banner = <<-EOS
████████╗██╗ ██████╗    ████████╗ █████╗  ██████╗    ████████╗ ██████╗ ███████╗
╚══██╔══╝██║██╔════╝    ╚══██╔══╝██╔══██╗██╔════╝    ╚══██╔══╝██╔═══██╗██╔════╝
   ██║   ██║██║            ██║   ███████║██║            ██║   ██║   ██║█████╗  
   ██║   ██║██║            ██║   ██╔══██║██║            ██║   ██║   ██║██╔══╝  
   ██║   ██║╚██████╗       ██║   ██║  ██║╚██████╗       ██║   ╚██████╔╝███████╗
   ╚═╝   ╚═╝ ╚═════╝       ╚═╝   ╚═╝  ╚═╝ ╚═════╝       ╚═╝    ╚═════╝ ╚══════╝
      EOS
      puts '', banner, ''
    end

    def self.game_on
      banner = <<-EOS
  ▄████  ▄▄▄       ███▄ ▄███▓▓█████     ▒█████   ███▄    █  ▐██▌ 
 ██▒ ▀█▒▒████▄    ▓██▒▀█▀ ██▒▓█   ▀    ▒██▒  ██▒ ██ ▀█   █  ▐██▌ 
▒██░▄▄▄░▒██  ▀█▄  ▓██    ▓██░▒███      ▒██░  ██▒▓██  ▀█ ██▒ ▐██▌ 
░▓█  ██▓░██▄▄▄▄██ ▒██    ▒██ ▒▓█  ▄    ▒██   ██░▓██▒  ▐▌██▒ ▓██▒ 
░▒▓███▀▒ ▓█   ▓██▒▒██▒   ░██▒░▒████▒   ░ ████▓▒░▒██░   ▓██░ ▒▄▄  
 ░▒   ▒  ▒▒   ▓▒█░░ ▒░   ░  ░░░ ▒░ ░   ░ ▒░▒░▒░ ░ ▒░   ▒ ▒  ░▀▀▒ 
  ░   ░   ▒   ▒▒ ░░  ░      ░ ░ ░  ░     ░ ▒ ▒░ ░ ░░   ░ ▒░ ░  ░ 
░ ░   ░   ░   ▒   ░      ░      ░      ░ ░ ░ ▒     ░   ░ ░     ░ 
      ░       ░  ░       ░      ░  ░       ░ ░           ░  ░   
      EOS
      puts '', banner, ''
    end

    def self.exit_message
      banner = <<-EOS
 ██████╗  ██████╗  ██████╗ ██████╗ ██████╗ ██╗   ██╗███████╗██╗
██╔════╝ ██╔═══██╗██╔═══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝██╔════╝██║
██║  ███╗██║   ██║██║   ██║██║  ██║██████╔╝ ╚████╔╝ █████╗  ██║
██║   ██║██║   ██║██║   ██║██║  ██║██╔══██╗  ╚██╔╝  ██╔══╝  ╚═╝
╚██████╔╝╚██████╔╝╚██████╔╝██████╔╝██████╔╝   ██║   ███████╗██╗
 ╚═════╝  ╚═════╝  ╚═════╝ ╚═════╝ ╚═════╝    ╚═╝   ╚══════╝╚═╝
      EOS
      puts '', banner, ''
    end
  end
end
