
# Was ist dieses Projekt?
Ich mache  in diesem kleinen Projekt aus einer 'Markdown'-Datei eine 'PDF'-Datei mit einer POWERPOINT-Präsentation.

# Verwendung

Wenn pandoc auf deinem Rechner richtig installiert ist, kannst du die POWERPOINT-Präsentation mit folgendem Befehl erzeugen:
~~~
pandoc -t beamer referat.md -o referat.pdf
~~~

Weil es aber nicht so einfach ist, pandoc mit den richtigen Paketen zu installieren, kannst Du das gleiche mit folgendem Befehl erreichen:
~~~
docker run -v $(pwd):/workdir ludwigprager/pandoc pandoc -t beamer referat.md -o referat.pdf
~~~
Dazu musst du aber das Programm "docker" installiert haben.
