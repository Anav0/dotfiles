latexmk -g -output-directory=build -pdf -pvc $1.tex &
zathura build/$1.pdf
