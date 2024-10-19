---
## Front matter
lang: ru-RU
title: Элементы криптографии. Однократное гаммирование
subtitle: Лабораторная работа № 7
author:
  - Абу Сувейлим М. М.
institute:
  - Российский университет дружбы народов, Москва, Россия
date: 10 января 2003

## i18n babel
babel-lang: russian
babel-otherlangs: english

## Formatting pdf
toc: false
toc-title: Содержание
slide_level: 2
aspectratio: 169
section-titles: true
theme: metropolis
header-includes:
 - \metroset{progressbar=frametitle,sectionpage=progressbar,numbering=fraction}
---

# Информация

## Докладчик

:::::::::::::: {.columns align=center}
::: {.column width="70%"}

  * Абу Сувейлим Мухаммед Мунифович
  * Студент
  * Российский университет дружбы народов
  * [1032215135@pfur.ru](mailto:1032215135@pfur.ru)
  * <https://mukhammed-abu-suveilim.github.io/>

:::
::::::::::::::

# Вводная часть


## Цели и задачи

- Освоить на практике применение режима однократного гаммирования [@infosec].
- Нужно подобрать ключ, чтобы получить сообщение «С Новым Годом,
друзья!». Требуется разработать приложение, позволяющее шифровать и
дешифровать данные в режиме однократного гаммирования. Приложение
должно:
1. Определить вид шифротекста при известном ключе и известном открытом тексте.
2. Определить ключ, с помощью которого шифротекст может быть преобразован в некоторый фрагмент текста, представляющий собой один из
возможных вариантов прочтения открытого текста.

## Материалы и методы

1. Kulyabov D., Korolkova A., Gevorkyan M. Информационная безопасность компьютерных сетей: лабораторные работы. 2015.

# Выполнение лабораторной работы

## Python: import 

Во-первых, нужно импортировать нужные библиотеки командой:

```python
import os
```
## Python: xor_bytes(text, key) 

Далее, для максимально эффективной работы лучше выполнять команды на уровне битов. Для этого мы напиши функцию xor_bytes наложения гаммы:

```python
def xor_bytes(text, key):
    return bytes([a ^ b for a, b in zip(text, key)])
```

## Python: encrypt(text)

Далее, напишем две функции для encoding и decoding:

```python
def encrypt(text):
    text_bytes  = text.encode('utf-8') # Converet text to bytes
    key = os.urandom(len(text_bytes))
    cipherText = xor_bytes(text_bytes, key)
    return cipherText, key
```

## Python: decrypt(cipherText, key)


```python
def decrypt(cipherText, key):
    org_text_bytes = xor_bytes(cipherText, key)
    return org_text_bytes.decode('utf-8')
```

## С Новым Годом, друзья!

Выполняем пример из учебника:

```python
text = "С Новым Годом, друзья!"
cipherText, key =  encrypt(text)
print(f"Cipher text: {cipherText}")
print(f"Key: {key}")
decryptText = decrypt(cipherText, key)
print(f"Decrypted text: {decryptText}")
```

## Результат

Получаем такой результат:

```sh
Cipher text: b'\x1a<]\x0cc\x81\x00\xf5B{"{\xb1\xc3\xf1\x1e\x82\x94RUOZ\xee^\xf2K*ua\xffK(\x89\x10@;F\x10\xcc'
Key: b'\xca\x9d}\xdc\xfeQ\xbe%\xf0\xaa\xa9\xab\r\xe3!\x8dR*\x82\xe1\x9f\xe4>\xe2\xdek\xfa\xc1\xb0\x7f\x9a\xabY\xa7\x91\xb7\x97\x9f\xed'
Decrypted text: С Новым Годом, друзья!
```

## Тест кейс 

Если в Key поминать значения на другие, например на:

```python
key1 = b'\xca\x9d}\xdc\xfeQ\xbe%\xf0\xaa\xa9\xab\r\xe3!\x8dR*\x82\xe1\x9f\xe4>\xe2\xdek\xfa\xc2\xb2\x7f\x9a\xabY\xa7\x91\xb7\x97\x9f\xed'
decryptText = decrypt(cipherText, key1)
print(f"Decrypted text: {decryptText}")
```
## Результат тест кейса

получим:

```sh
Decrypted text: С Новым Годом, зӀузья!
```

# Выводы

Основали на практике применение режима однократного гаммирования.