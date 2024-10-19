---
## Front matter
title: "Лабораторная работа № 7"
subtitle: "Элементы криптографии. Однократное гаммирование"
author: "Абу Сувейлим Мухаммед Мунифович"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: IBM Plex Serif
romanfont: IBM Plex Serif
sansfont: IBM Plex Sans
monofont: IBM Plex Mono
mathfont: STIX Two Math
mainfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
romanfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
sansfontoptions: Ligatures=Common,Ligatures=TeX,Scale=MatchLowercase,Scale=0.94
monofontoptions: Scale=MatchLowercase,Scale=0.94,FakeStretch=0.9
mathfontoptions:
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Освоить на практике применение режима однократного гаммирования [@infosec].

# Задание

Нужно подобрать ключ, чтобы получить сообщение «С Новым Годом,
друзья!». Требуется разработать приложение, позволяющее шифровать и
дешифровать данные в режиме однократного гаммирования. Приложение
должно:
1. Определить вид шифротекста при известном ключе и известном открытом тексте.
2. Определить ключ, с помощью которого шифротекст может быть преобразован в некоторый фрагмент текста, представляющий собой один из
возможных вариантов прочтения открытого текста.

# Выполнение лабораторной работы

Во-первых, нужно импортировать нужные библиотеки командой:

```python
import os
```

Далее, для максимально эффективной работы лучше выполнять команды на уровне битов. Для этого мы напиши функцию xor_bytes наложения гаммы:

```python
def xor_bytes(text, key):
    return bytes([a ^ b for a, b in zip(text, key)])
```
Далее, напишем две функции для encoding и decoding:

```python
def encrypt(text):
    text_bytes  = text.encode('utf-8') # Converet text to bytes
    key = os.urandom(len(text_bytes))
    cipherText = xor_bytes(text_bytes, key)
    return cipherText, key

def decrypt(cipherText, key):
    org_text_bytes = xor_bytes(cipherText, key)
    return org_text_bytes.decode('utf-8')
```

Выполняем пример из учебника:

```python
text = "С Новым Годом, друзья!"
cipherText, key =  encrypt(text)
print(f"Cipher text: {cipherText}")
print(f"Key: {key}")
decryptText = decrypt(cipherText, key)
print(f"Decrypted text: {decryptText}")
```

Получаем такой результат:

```sh
Cipher text: b'\x1a<]\x0cc\x81\x00\xf5B{"{\xb1\xc3\xf1\x1e\x82\x94RUOZ\xee^\xf2K*ua\xffK(\x89\x10@;F\x10\xcc'
Key: b'\xca\x9d}\xdc\xfeQ\xbe%\xf0\xaa\xa9\xab\r\xe3!\x8dR*\x82\xe1\x9f\xe4>\xe2\xdek\xfa\xc1\xb0\x7f\x9a\xabY\xa7\x91\xb7\x97\x9f\xed'
Decrypted text: С Новым Годом, друзья!
```

Если в Key поминать значения на другие, например на:

```python
key1 = b'\xca\x9d}\xdc\xfeQ\xbe%\xf0\xaa\xa9\xab\r\xe3!\x8dR*\x82\xe1\x9f\xe4>\xe2\xdek\xfa\xc2\xb2\x7f\x9a\xabY\xa7\x91\xb7\x97\x9f\xed'
decryptText = decrypt(cipherText, key1)
print(f"Decrypted text: {decryptText}")
```
получим:

```sh
Decrypted text: С Новым Годом, зӀузья!
```

# Выводы

Основали на практике применение режима однократного гаммирования.

# Список литературы{.unnumbered}

::: {#refs}
:::
