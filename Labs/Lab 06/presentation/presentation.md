---
## Front matter
lang: ru-RU
title: Мандатное разграничение прав в Linux
subtitle: Лабораторная работа № 6
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

- Развить навыки администрирования ОС Linux. Получить первое практическое знакомство с технологией SELinux.
Проверить работу SELinx на практике совместно с веб-сервером Apache.

## Материалы и методы

- Таненбаум Э., Бос Х. Современные операционные системы. 4-е изд. СПб.:
Питер, 2015. 1120 с.

# Выполнение лабораторной работы

## Коианда getenforce

![Коианда getenforce](image/screenshot-01.jpg){#fig:001 width=60%}

## Коианда service httpd status

![Коианда service httpd status](image/screenshot-03.jpg){#fig:002 width=60%}

## Коианда ps -eZ | grep httpd

![Коианда ps -eZ | grep httpd](image/screenshot-04.jpg){#fig:003 width=60%}

## Коианда sestatus -b | grep httpd

![Коианда sestatus -b | grep httpd](image/screenshot-06.jpg){#fig:004 width=60%}

## Коианда seinfo

![Коианда seinfo](image/screenshot-07.jpg){#fig:005 width=60%}

## Коианда ls -lZ /var/www

![Коианда ls -lZ /var/www](image/screenshot-08.jpg){#fig:006 width=60%}

## html-файл test.html

![html-файл test.html](image/screenshot-09.jpg){#fig:007 width=60%}
 
## html-файл test.html 2

![html-файл test.html 2](image/screenshot-010.jpg){#fig:008 width=60%}

## Коианда man httpd

![Коианда man httpd](image/screenshot-11.jpg){#fig:009 width=60%}

## Коианда chcon

![Коианда chcon](image/screenshot-13.jpg){#fig:010 width=60%}

## Ошибка Forbidden

![Ошибка Forbidden](image/screenshot-14.jpg){#fig:011 width=60%}

## Команда ls -l /var/www/html/test.html

![Команда ls -l /var/www/html/test.html](image/screenshot-15.jpg){#fig:012 width=60%}

## Лог-файлы

![Лог-файлы](image/screenshot-16.jpg){#fig:013 width=60%}


## Команда semanage

![Команда semanage](image/screenshot-18.jpg){#fig:014 width=60%}

## Команда rm /var/www/html/test.html

![Команда rm /var/www/html/test.html](image/screenshot-20.jpg){#fig:015 width=60%}

# Выводы

Развивли свои навыки администрирования ОС Linux. Получить первое практическое знакомство с технологией SELinux1. Проверили работу SELinx на практике совместно с веб-сервером
Apache.