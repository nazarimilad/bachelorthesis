# bachelorthesis

## Inhoud

### Voorstel

### Bachelorproef

### Poster

### Meta

#### Automatisatie

Bij elke push naar de `master` branch wordt de [CI/CD pipeline](.github/workflows/main.yml) getriggerd.
De volgende acties worden uitgevoerd:

1. De [bachelorproef](bachproef/bachproef-tin.tex) en [bachelorproefvoorstel](voorstel/voorstel.tex) LaTeX bestanden worden gecompileerd naar overeenkomstige PDF-bestanden

2. De bachelorproef wordt geanalyseerd a.d.h.v. [dit script](bachproef/analyse_bachelor_thesis.py). Er wordt o.a. bekeken hoeveel pagina's het uiteindelijke PDF bevat, hoeveel tabellen, citaties en figuren er aanwezig zijn. Tenslotte wordt er ook het totaal aantal woorden geteld. In deze laatste metric wordt er niet rekening gehouden met woorden aanwezig in de voorblad, inhoudstabel, bijlagen, tabellen of figuren (figuurbeschrijving), enkel zuiver tekst.

3. Er wordt tenslotte een [release](https://github.com/nazarimilad/bachelorthesis/releases) aangemaakt waarbij de hierjuist beschreven metrics in de body van de release staan en de PDF's als binaries bijlagen toegevoegd zijn.

Werkpunten:

* Er wordt momenteel een [awk-script](bachproef/recursivelyMergeTex.awk) gebruikt om alle .tex bestanden recursief te combineren in één grote tex voor verdere analyse, aangezien de hoofd .tex een kleine bestand is met meerdere `\input`'s. Deze awk-script wordt als eerst opgeroepen in de [python script](bachproef/analyse_bachelor_thesis.py) vooraleer data processing kan gebeuren. Het zou beter zijn mocht de awk script vervangen worden door python code als een methode in de python script. 

* Er wordt in de pipeline momenteel één job met een groot aantal steps gebruikt. Deze zou beter opgeplist worden in 3 jobs: compilatie, analyse en release

* Extra metrics toevoegen:
    * percentage gedetecteerd plagiaat (misschien kunnen we van Hogent hiervoor toegang krijgen tot hun plagiaatdetectie API?)
    * andere ideeën?

* De analyse script in een aparte folder 'scripts' plaatsen
