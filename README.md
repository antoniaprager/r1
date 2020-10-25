# r1
Wenn der convert-Befehl aus dem Skript nicht ausgeführt wird, dann mit "vi" diesen Link:/etc/ImageMagick-6/policy.xml wie folgt bearbeiten:

1.:<policy domain="coder" rights="read | write" pattern="PDF" /> direkt in die Zeile vor "</policymap>" kopieren.

2.:Die Zeile suchenin der das vorkommt: "value="1GiB". 

3.:Das "value="1GiB" in "value="16GiB" umwandeln.


TIPP:Am Besten ist es dann den convert-Befehl auszuführen und dabei die *.jpg-Dateien in eine z.B. a.pdf-Datei zu schieben, weil in diesem Dateinamen keine/wenige Leerzeichen vorkommen.


