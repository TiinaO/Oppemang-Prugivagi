# Miks tuleb arendajana kasutada harusid?
**Isolatsioon:** Harud võimaldavad töötada oma koodibaasi isoleeritud versioonides, ilma et mõjutaks põhikoodi. See tähendab, et saab eksperimenteerida uute funktsioonidega, parandada vigu või teha muid muudatusi, kahjustamata põhikoodi stabiilsust.

**Koostöö:** Kui töötada meeskonnas, võimaldavad harud igal meeskonnaliikmel töötada iseseisvalt konkreetse ülesande kallal, ilma et tekiks konflikte teiste poolt tehtud muudatustega. See hõlbustab paralleelset arendamist ja koostööd.

**Versioonikontroll:** Harude kasutamine võimaldab jälgida ja hallata erinevaid versioone oma koodist. Saab luua haru igale uuele funktsioonile või parandusele ning seejärel ühendada need põhikoodiga (peamise haruga), kui need on valmis ja testitud.


## Haru loomine GitHub Desktopiga
1. Veendu, et olen main haru peal.
2. Tee - Fetch origin. See tõmbab kõik muudatused, mis vahepeal main harus tehtud on.
3. Vajuta Current branch juures noolt ![currnet branch](/Images_for_readme/image.png)
4. Trüki  input ribale soovitud nimi branchile 
5. Vajuta create branch ![Create branch](/Images_for_readme/image-2.png)
6. Kui sul on mitu branchi, siis tuleb valida, millise sa aluseks võtad. Aluseks võtakse üldiselt Main ![main](/Images_for_readme/image-3.png)

Branch on loodud.

## Harusse, enda muudatuste commitimine
1. Tee linnuke failide juures, mida soovid lisada
2. Lisa commitimise info
3. Vajuta commit to branchi_nimi
4. Kui sa ei ole branchi veel giti pushinud, siis esimene asi, mida teha saad, on publish branch (see viib kõik commititud muudatused vastavasse harru ja muudab selle ka veebis nähtavaks)
5. Kui teed veel muudatusi, siis korda samme 1-3 aga nüüd on võimalik vajutada nuppu 



## Üldine info
Enne enda haru pushimist on mõistlik main haru sisu tõmmata enda harusse. Selleks on mitu olulist põhjust.

**Uuenduste konfliktide vältimine:** Kui tõmmata peamise haru sisu enne enda uuenduste lisamist, saab enda haru ajakohaseks ning väheneb võimalus konfliktide tekkeks teiste arendajate muudatustega.

**Eelnevate muudatuste testimine:** Kui teised arendajad on teinud muudatusi peamises harus, siis saab enda muudatusi testida nende muudatustega koos, et veenduda, et kood töötab korralikult.

**Stabiilsema peamise haru hoidmine:** Kui teete muudatusi oma harul ja testite neid põhjalikult, tagab peamisele harule lükkamine, et kõik uued muudatused on kontrollitud ja stabiilsed.

## Harudega tegelemin GIT Bashiga
Git bash commandid
Tuleb olla projekti kaustas, selle jaoks on võimalik minna soovitud kasuta kasutades ```cd path\to\directory```
```
git checkout -b branch-name
```
Kui soovid teada, milliseid faile on muudetud

```
git status
```

Kui soovid lisada muudatustega failid commitimiseks
```
git add file-name
```

Kui vajalikud failid on lisatud, siis
```
git commit -m "Issue and what was done"
```

Kui soovid, et see jõuaks ka githubi

```
git push origin branch-name
```