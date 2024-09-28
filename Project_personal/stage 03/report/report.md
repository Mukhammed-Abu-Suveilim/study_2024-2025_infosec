---
## Front matter
title: "Использование Hydra"
subtitle: "Этап 3"
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

Выполнить простейшие команды инструмента Hydra.

# Задание

Взломать пароль по имени пользователя.

# Теоретическое введение

Hydra - это программное обеспечение с открытым исходным кодом для перебора паролей в реальном времени от различных онлайн сервисов, веб-приложений, FTP, SSH и других протоколов. Это распараллеленный взломщик для входа в систему, он поддерживает множество протоколов для осуществления атак. Пользователь быстро и с легкостью может добавить новые модули. Hydra предоставляет специалистам в сфере ИБ возможность узнать, насколько легко можно получить несанкционированный доступ к системе с удаленного устройства.  [@cryptoparty]

# Выполнение лабораторной работы

Для начала создаим новый пользователь testuser (рис. [-@fig:001]):

![Пользователь testuser](image/screenshot-01.jpg){#fig:001 width=70%}

Проверим данные пользователя (рис. [-@fig:002]):

![Команда cat | grep](image/screenshot-02.jpg){#fig:002 width=70%}

Далее, определим ip адресс машинной (рис. [-@fig:003]):

![Команда ifconfig](image/screenshot-03.jpg){#fig:003 width=70%}

Наконец то указывается список пользователей и паролей, ip адресс, протокол и выполняем команду (рис. [-@fig:004]):

![Команда hydra](image/screenshot-04.jpg){#fig:004 width=70%}

Получили логин "testuser" и пароль "password123"

# Выводы

В результате выполнения работы мы повысили свои навыки использования инструмента Hydra. [@KaliLinux]

# Список литературы{.unnumbered}

::: {#refs}
:::
