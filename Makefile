DOT_FILES = .zhsrc .vimrc .vim

all: zsh vim

#zsh: $(foreach f, $(filter .zsh%, $(DOT_FILES)), link-dot-file-$(f))

#vim: $(foreach f, $(filter .vim%, $(DOT_FILES)), link-dot-file-$(f))

.PHONY: clean

#clean: $(foreach f, $(DOT_FILES), unlink-dot-file-$(f))


clean: $(foreach f, $(DOT_FILES), unlink-dot-file-$(f))

zsh: $(foreach f, $(filter .zsh%, $(DOT_FILES)), link-dot-file-$(f))

vim: $(foreach f, $(filter .vim%, $(DOT_FILES)), link-dot-file-$(f))

link-dot-file-%: %
	@echo "Create Symlink $(shell echo $< | sed "s/^.//") => $(HOME)/$<"
	@ln -snf $(CURDIR)/$(shell echo $< | sed "s/^.//") $(HOME)/$<

unlink-dot-file-%: %
	@echo "Remove Symlink $< => $(HOME)/$<"
	@$(RM) $(HOME)/$<

