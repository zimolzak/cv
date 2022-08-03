# Just takes my public LaTeX CV and replaces placeholders with real
# addresses, phones, etc. Filename is hard-coded in.

# Usual usage: python preprocess.py > zimolzak-cv.tex

from sys import argv
from secrets import DATA

print("""%% Automatically generated file
%%
%% DO NOT EDIT.
%%
%% Unless you don't want Git to track your changes.
%%


""")

with open('zimolzak-cv-pre.tex') as fh:
    for line in fh:
        for k, v in DATA.items():
            if len(argv) == 1:
                line = line.replace(k, v)
            elif argv[1] == '--censor':
                line = line.replace(k, '-')
            else:
                line = line.replace(k, v)
        print(line, end='')
