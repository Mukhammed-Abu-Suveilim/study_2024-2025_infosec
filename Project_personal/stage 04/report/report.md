---
## Front matter
title: "Использование nikto"
subtitle: "Этап 4"
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

Выполнить простейшие команды инструмента nikto.

# Задание

Отсканировать сайт университета <esystem.rudn.ru> на безопасности веб-сервера.

# Теоретическое введение

nikto — базовый сканер безопасности веб-сервера. Он сканирует и обнаруживает уязвимости в веб-приложениях, обычно вызванные неправильной конфигурацией на самом сервере, файлами, установленными по умолчанию, и небезопасными файлами, а также устаревшими серверными приложениями [@KaliLinux].

# Выполнение лабораторной работы

Во-первых, установим инструмент nikto, если он уже не установлен на виртуальной машине, командой (рис. [-@fig:001]):

![Установка nikto](image/screenshot-01.jpg){#fig:001 width=70%}

Можно увидеть, что у нас версия nikto - v2.5.0

Далее, выполняем простую задачу/команду:

```bash
nikto -h esystem.rudn.ru -ssl
```

nikto - это сам инструмент для сканирования веб-серверов на наличие уязвимостей.

-h esystem.rudn.ru — указывает цель сканирования, в данном случае - esystem.rudn.ru.
- параметр -h используется для задания хоста, который будет проверяться. Вместо доменного имени можно было бы указать IP-адрес веб-сервера.

-ssl - этот флаг указывает Nikto на то, что сканируемый веб-сервер использует SSL/TLS для шифрования соединения (т.е. работает через HTTPS на порту 443 по умолчанию). Это важно для корректного установления безопасного соединения между сканером и сервером.


# Анализ результатов

После выполнения предыдущей команды, мы получили следующую информацию (рис. [-@fig:002]):


![Команда nikto -h esystem.rudn.ru -ssl](image/screenshot-03.jpg){#fig:002 width=70%}

**Основная информация о сканировании:**

IP-адрес цели: 185.178.208.57
Имя хоста: esystem.rudn.ru
Порт: 443 (порт по умолчанию для HTTPS)

**SSL Информация:**
Сертификат сайта выдан для домена *.rudn.ru.
Используемый шифр для TLS: TLS_AES_128_GCM_SHA256.
Сертификат выдан центром сертификации GlobalSign.

**Найденные проблемы и предупреждения:**

Пять cookies файлов (__ddg8_, __ddg9_, __ddg10_, __ddg1_, MoodleSession) были созданы без флагов безопасности:

- Без флага Secure - эти cookies не защищены при передаче через незащищенные соединения (HTTP). Флаг Secure гарантирует, что cookie передаются только через зашифрованные соединения (HTTPS).

- Без флага HttpOnly - это значит, что данные cookies могут быть доступны через JavaScript на стороне клиента, что увеличивает риск XSS-атак (межсайтовый скриптинг).

В cookie файле __ddg9_ обнаружен IP-адрес 57.129.24.68, что является потенциальной утечкой информации. 

**Отсутствие важных заголовков безопасности:**

Отсутствует заголовок Strict-Transport-Security (HSTS), который предотвращает атаки с понижением уровня безопасности, обеспечивая принудительное использование HTTPS.

Отсутствует заголовок X-Content-Type-Options, который предотвращает автоматическое определение браузером типа контента, что может привести к уязвимостям, связанным с MIME-типа (Multipurpose Internet Mail Extensions).

**Другие наблюдения:**

Заголовок access-control-allow-origin настроен на разрешение запросов от любых источников (*), что может быть небезопасно. 

Обнаружены нестандартные заголовки: content-style-type (указан как text/css) и content-script-type (указан как text/javascript).

В ответе от сервера содержится заголовок ddg-cache-status: MISS, что означает, что запрашиваемый ресурс не был найден в кеше (это относится к DDoS-защите сайта).

# Выводы

В результате выполнения работы мы повысили свои навыки использования инструмента nikto. [@OTUS]

# Список литературы{.unnumbered}

::: {#refs}
:::
