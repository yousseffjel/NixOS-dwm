{ config, pkgs, ... }:
let
  sensitiveAliases = import ./server.nix;
in
{
  users.users.yusuf.isNormalUser = true;

  home-manager.users.yusuf = { pkgs, ... }: {
    home.packages = [ pkgs.atool pkgs.httpie ];
    programs.kitty = {
	  	enable = true;
	  	font = {
	  		name = "FantasqueSansM Nerd Font";
	  		size = 13;
	  	};
	  	theme = "Catppuccin-Mocha";
	  	settings = {
	  		background_opacity = "1.0";
	  		window_decorations = "NONE";
	  		hide_window_decorations = "yes";
	  	};
	  };
    programs.zsh = {
		enable = true;
		autocd = true;
		enableAutosuggestions = true;
		defaultKeymap = "viins";
		dotDir = ".config/zsh";
		history = {
			path = ".cache/zsh/history";
			save = 20000;
			size = 20000;
		};
		completionInit = ''
			autoload -Uz compinit
			compinit
		'';
		historySubstringSearch = {
			enable = true;
			searchDownKey = [ "^[[A" "^P" ];
			searchUpKey = [ "^[[B" "^N" ];
		};
		envExtra = '' 
			export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
			export PATH=$HOME/.local/bin:$HOME/.bin:$PATH
		'';
		initExtraBeforeCompInit = ''
			zstyle ':completion:*' completer _menu _expand _complete _correct _approximate
			zstyle ':completion:*' completions 0
			zstyle ':completion:*' glob 0
			zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
			zstyle ':completion:*' max-errors 10
			zstyle ':completion:*' special-dirs true
			zstyle ':completion:*' substitute 1
			zstyle :compinstall filename '/home/yusuf/.config/zsh/.zshrc'
		'';
	};
	home.shellAliases = (import ./server.nix) // {
	l = "eza -l --icons";
 	ls = "eza -1 --icons";
 	ll = "eza -la --icons";
 	ld = "eza -lD --icons";
 	cp = "cp -i";
 	mv = "mv -i";
 	rm = "trash -v";
 	mkdir = "mkdir -p";
 	cat = "bat";
 	da = "date '+Y-%m-%d %A %T %Z'";
	grep = "grep --color=always";
	du = "dust -r";
	df = "df -h";
	cd = "z";
 	diff = "diff --color=always";
 	#grep = "grep --color=always";
 	duf = "duf -hide-fs tmpfs,devtmpfs";
 	cc = "cd ~/.config";
 	wget = "wget --hsts-file='$XDG_CACHE_HOME/wget-hsts'";
 	wifi = "nmtui";

	# Alias's for safe and forced reboots
 	rebootsafe = "sudo shutdown -r now";
 	rebootforce = "sudo shutdown -r -n now";
 	shutdown = "sudo shutdown";

	# Alias chmod commands
 	mx = "chmod a+x";
 	#000 = "chmod -R 000";
 	#644 = "chmod -R 644";
 	#666 = "chmod -R 666";
 	#755 = "chmod -R 755";
 	#777 = "chmod -R 777";
	
 	# Search running processes
 	p = "ps aux | grep ";
 	topcpu = "/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10";

 	# Change directory aliases
 	home = "cd ~";
 	#cd.. = "cd ..";
 	#.. = "cd ..";
 	#... = "cd ../..";
 	#.... = "cd ../../..";
 	#..... = "cd ../../../..";

 	f = "find . | grep ";

	vim = "nvim";
	sduo = "sudo";
	suod = "sudo";
	sz = "source ~/.config/zsh/.zshrc";

	# Alias's to show disk space and space used in a folder
	diskspace = "du -S | sort -n -r |more";
	folders = "du -h --max-depth=1";
	folderssort = "find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn";
	tree = "tree -CAhF --dirsfirst";
	treed = "tree -CAFd";
	mountedinfo = "df -hT";
	#grep = "/usr/bin/grep $GREP_OPTIONS";
	};
	programs.zoxide = {
	enable = true;
	};
	programs.starship = {
	enable = true;
	};
	xresources.properties = {
		"Xcursor.theme" = "macOS-Monterey";
		"Xft.dpi" = "80";
	};
	xdg.userDirs = {
		enable = true;
		createDirectories = true;
	};

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "24.05";
  };
}
