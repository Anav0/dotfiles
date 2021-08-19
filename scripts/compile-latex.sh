#xelatex -g -outdir=build -pvc $1.tex &
#latexmk -xelatex -g -output-directory=build -pvc $1.tex &
latexmk -g -output-directory=build -pvc $1.tex &
#xelatex -g -synctex=1 -interaction=nonstopmode -output-directory=build $1.tex &
#xelatex -pvc -synctex=1 -interaction=nonstopmode -output-directory=build $1.tex &
zathura build/$1.pdf
