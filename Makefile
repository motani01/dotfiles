#DOT_FILES = .zshrc .zsh .vimrc .vim .tmux.conf .tmux .gitconfig .gitignore .ctags
DOT_FILES = .zshrc .vimrc .vim .tmux.conf .gitconfig .gitignore .ctags .zsh .bashrc .bash_profile .ssh .bin
CURRENTDIR = $(shell pwd)
BACKUPDIR = $(HOME)/.dotfiles.bk

all: backup clean install
install: gitsubmodule zsh vim tmux git ctags bash ssh

gitsubmodule:
	git submodule update --init
	git submodule foreach 'git checkout master; git pull'

backup: make-backup-dir $(foreach f, $(DOT_FILES), backup-dot-files-$(f))

restore: clean $(foreach f, $(DOT_FILES), restore-dot-files-$(f))

remove: restore  $(foreach f, $(DOT_FILES), remove-dot-files-$(f))

clean: $(foreach f, $(DOT_FILES), unlink-dot-file-$(f))

zsh: $(foreach f, $(filter .zsh%, $(DOT_FILES)), link-dot-file-$(f)) add-zsh-conf link-bin-dir

vim: $(foreach f, $(filter .vim%, $(DOT_FILES)), link-dot-file-$(f)) vim-dependency

tmux: $(foreach f, $(filter .tmux%, $(DOT_FILES)), link-dot-file-$(f))

git: $(foreach f, $(filter .git%, $(DOT_FILES)), link-dot-file-$(f))

ctags: $(foreach f, $(filter .ctags%, $(DOT_FILES)), link-dot-file-$(f))

bash: $(foreach f, $(filter .bash%, $(DOT_FILES)), link-dot-file-$(f))

ssh: $(foreach f, $(filter .ssh%, $(DOT_FILES)), link-dot-file-$(f))

add-zsh-conf:
	@cp zsh_conf/* zsh/themes/

make-backup-dir:
	mkdir -p $(BACKUPDIR)

link-bin-dir:
	ln -snf $(CURRENTDIR)/bin $(HOME)/.bin

vim-dependency:
	vim -c NeoBundleInstall

link-dot-file-%: %
	@echo "Create Symlink $(shell echo $< | sed "s/^.//") => $(HOME)/$<"
	@ln -snf $(CURRENTDIR)/$(shell echo $< | sed "s/^.//") $(HOME)/$<

unlink-dot-file-%: %
	@echo "Remove Symlink $(HOME)/$<"
	@$(RM) $(HOME)/$<

restore-dot-files-%: %
	@if [ -f $(BACKUPDIR)/$< -o -d $(BACKUPDIR)/$< ]; then \
    echo "Restore $(BACKUPDIR)/$< => $(HOME)/$<";\
    cp -rp $(BACKUPDIR)/$< $(HOME)/;\
  fi

backup-dot-files-%: %
	@if [ \( -f $(HOME)/$< -o -d $(HOME)/$< \) -a ! -L $(HOME)/$< ]; then \
    echo "Create Backup $(HOME)/$< => $(BACKUPDIR)/$<";\
    cp -rp $(HOME)/$< $(BACKUPDIR)/;\
  fi

remove-dot-files-%: %
	@if [ -f $(HOME)/$< -o -d $(HOME)/$< ]; then \
    echo "Remove $(HOME)/$<";\
    rm -rf $(HOME)/$< ;\
  fi

.PHONY: clean $(DOT_FILES)
