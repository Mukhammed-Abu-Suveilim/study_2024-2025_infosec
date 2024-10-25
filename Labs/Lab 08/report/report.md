---
## Front matter
title: "Лабораторная работа № 8"
subtitle: "Элементы криптографии. Шифрование (кодирование) различных исходных текстов одним ключом"
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

Освоить на практике применение режима однократного гаммирования на примере кодирования различных исходных текстов одним ключом [@infosec].

# Задание

Два текста кодируются одним ключом (однократное гаммирование).
Требуется не зная ключа и не стремясь его определить, прочитать оба текста. Необходимо разработать приложение, позволяющее шифровать и дешифровать тексты P1 и P2 в режиме однократного гаммирования. Приложение должно определить вид шифротекстов C1 и C2 обоих текстов P1 и P2 при известном ключе; Необходимо определить и выразить аналитически способ, при котором злоумышленник может прочитать оба текста, не зная ключа и не стремясь его определить.


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
    text_bytes = text.encode('utf-8')
    cipher_text = xor_bytes(text_bytes, key)
    return cipher_text

def decrypt(cipher_text, key):
    plain_text_bytes = xor_bytes(cipher_text, key)
    return plain_text_bytes.decode('utf-8')
```

Выполняем пример из учебника:

```python
# Given texts (P1 and P2)
P1 = "НаВашисходящийот1204"
P2 = "ВСеверныйфилиалБанка"

# Display the original texts and the key
print(f"Text P1: {P1}")
print(f"Text P2: {P2}")

# Convert texts to bytes
P1_bytes = P1.encode('utf-8')
P2_bytes = P2.encode('utf-8')
```
Создадим ключ дленной текста P1:

```python
key = os.urandom(len(P1_bytes))
# Encrypt P1 and P2 with the same key
C1 = encrypt(P1, key)
C2 = encrypt(P2, key)

# Display the encrypted texts and the key
print(f"C1 (Cipher text for P1): {C1}")
print(f"C2 (Cipher text for P2): {C2}")
print(f"Key: {key}")

# Decrypt the texts back to verify correctness
P1_decrypted = decrypt(C1, key)
P2_decrypted = decrypt(C2, key)
print(f"Decrypted P1: {P1_decrypted}")
print(f"Decrypted P2: {P2_decrypted}")


P1_xor_P2 = xor_bytes(C1, C2)
print(f"P1 XOR P2: {P1_xor_P2}")


P2_recovered_bytes = xor_bytes(P1_xor_P2, P1_bytes)
P2_recovered = P2_recovered_bytes.decode('utf-8')
print(f"Recovered P2 using P1 and C1 XOR C2: {P2_recovered}")
```

Получаем такой результат:

```sh
Text P1: НаВашисходящийот1204
Text P2: ВСеверныйфилиалБанка
C1 (Cipher text for P1): b"\x95\x0e4\x99\x8d\xef.\xff\x11\x8dp\x8e\xde\xcc\xcd\\, Yd\r\xec\xdc\x8b'p\x19\xd3\xcbo\xbdB\xe2r\xedI"
C2 (Cipher text for P2): b"\x95\x014\x88\x8d\xc8.\xfd\x10\xb0q\xb6\xdf\xf0\xcdR,'XT\x0c\xdb\xdd\xb9'p\x19\xda\xcbj\xbcQ\x03\xf0\r\xc0"
Key: b'E\x93\xe4)]}\xfeO\xc0\x05\xa06\x0fM\x1c\xd9\xfc\x9e\x89\xd0\xdcc\r\x02\xf7\xc8\xc9j\x1b\xd1l\xc0\xd3@\xdd}'
Decrypted P1: НаВашисходящийот1204
Decrypted P2: ВСеверныйфилиалБан
P1 XOR P2: b"\x00\x0f\x00\x11\x00'\x00\x02\x01=\x018\x01<\x00\x0e\x00\x07\x010\x017\x012\x00\x00\x00\t\x00\x05\x01\x13\xe1\x82\xe0\x89"
Recovered P2 using P1 and C1 XOR C2: ВСеверныйфилиалБан
```

# Выводы

Основали на практике применение режима однократного гаммирования на примере кодирования различных исходных текстов одним ключом.

# Список литературы{.unnumbered}

::: {#refs}
:::
