from secrets import DATA

with open('zimolzak-cv-pre.tex') as fh:
    for line in fh:
        for k, v in DATA.items():
            line = line.replace(k, v)
        print(line, end='')
