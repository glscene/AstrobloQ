# AstrobloQ

Астромодель нооэфолюции Галактики. Построение модели нооэволюции Млечного Пути и численного решения парадокса Ферми. 

Проекты разрабатывается с использованием графического движка GaLaXy Engine с кросс-платформенными компонентами GLScene/GXScene:
- [GaLaXy Engine](https://gitverse.ru/glscene/GLXEngine/);

Для астрометрических расчётов дополнительно могут использоваться следующие библиотеки: 
- [SOFA](./Externals/sofa), астрометрия на Cи, рекомендованная Международным Астрономическим Союзом IAU;
- [Astronomy Engine](./Externals/astronomy), пакет утилит по астрономии и гравитационным взаимодействиям;
- [IVOA](https://www.ivoa.net/astronomers/applications.html), стандарты Международной Виртуальной Обсерватории;
- [PostGIS](https://postgis.net/), расширение PostgreSQL для работы с пространственными данными;
- [CGAL](https://www.cgal.org/), библиотека алгоритмов по вычислительной геометрии на С++;

Интерактивная справка вызывается в зависимости от языка интерфейса:   
- [Galaxy](https://en.wikipedia.com/wiki/Galaxy), англоязычный раздел энциклопедии Wikipedia;
- [Галактика](https://ru.ruwiki.ru/wiki/Галактика), российская энциклопедия Рувики;
- подключение внешнего ИИ помощника или AI-Assistant;

![GalaxyGrid_ru](./docs/clips/GalaxyGrid.gif)
 
### AstroScene

Звёзды с экзопланетными системами

![Noonet](./docs/clips/Noosfera.png)

![Tehnosfera](./docs/clips/Meteors.gif)


![AstroScene](./docs/clips/PlanetarySystems.png)
![AstroScene](./docs/clips/SolarSystem.gif)

### Litosneta

Экзопланеты с литосферами
![Litosfera](./docs/clips/Litosfera_ru.png)

![Litosfera](./docs/clips/AnimationPlanet2a.gif)
![Litosfera](./docs/clips/AnimationAsteroid2.gif)

### Biosneta

Экзопланеты с биосферами
 
![Biosfera](./docs/clips/Biosfera.jpg)

![Biosfera](./docs/clips/AnimationDolphin.gif)
![Biosfera](./docs/clips/AnimationEcosystemA.gif)
![AstroScene](./docs/clips/AnimationLadybug2.gif)
![AstroScene](./docs/clips/AnimationFlock.gif)

### Tehnosneta

Экзопланеты с техносферами
![Tehnosfera](./docs/clips/Tehnosferas.png)

### Galaqtium

![GalaQtium](./docs/clips/Noostages_ru.jpg)
![GalaQtium](./docs/clips/AstrobloQ_ru.png)

Для моделирования используются следующие данные и методы вычислений: 

- исходные данные о звёздах и экзопланетах находятся в каталогах [HYG](https://github.com/astronexus/HYG-Database), [Gaia DR3](https://www.cosmos.esa.int/web/gaia/data), [Earthlike Terraplanets](https://phl.upr.edu/hwc);
- строение, структура и состав объектов в системах "Star->Galaxy->Universe" представляются в соответствующих масштабах с различным уровнем детализации L.O.D; 
- тетраэдральные сетки TetraDel строятся по известным x,y,z координатам звёзд в галактической системе координат и по векторам vx,vy,vz их собственных движений с экстраполяцией в прошлое и будущее на шкале -10;0;+10 Gyr;
- диаграммы сеток полиэдров PolyVor рассчитываются как двойственные графы тетраэдрализации Делоне;
- для построения грид-модели GalaGrid с кубическими ячейками галавокселей используется метод интерполяции NNI, Natural Neighbour Interpolation, учитывающем влияние соседних регионов, за исключением областей GalaxyVoids;
- изменение структуры Галактики во времени моделируется на базе [волновых функций плотности](https://github.com/beltoforion/Galaxy-Renderer) и путём экстраполяции данных звёздных каталогов в будущее;
- эволюция звёздных популяций прогнозируется согласно диаграмме Герцшпрунга-Рассела для звёздного каталога HYG;
- при моделировании коэволюции рассеянных скоплений звёзд, шаровых скоплений и галактик применяется операция свёртки рождения и гибели спектральных классов звёзд; 
- текстурные карты поверхности[землеподобных экзопланет](https://science.nasa.gov/exoplanets) синтезируются с помощью ИИ на основе измеренных параметров террапланет в зонах обитаемости звёзд; 
- задачи поиска кратчайшего безопасного межзвёздного пути, задача коммивояжера, освоения ресурсов и колонизации решаются на графах (x,y,z,t,c) тетрасети и по алгоритму A* на регулярной решетке GalaxyGrid; 
- для ноомодели Галактики оценивается число литосфер, биосфер, ноосфер и техносфер, состав модели за ядром и плотными газово-пылевыми облаками определяется путём экстраполяции структуры;
- оценка потенциала обитаемости Галактики выполняется по диаграмме Вороного и сопоставляется с интегральной формулой Дрейка; 
- численное решение парадокса Ферми даёт верхнюю оценку вероятного числа КЦ I типа по шкале академика РАН Н.С.Кардашёва;

Проекты на базе AstrobloQ могут быть как публичными, так и приватными по лицензии MPL 2.0. 
Графический движок [GaLaXy Engine](https://gitverse.ru/glscene/GLXEngine/) можно использовать
в стартапах бесплатно в образовании и [научных организациях](https://gitverse.ru/UniverseCETI/GalaxyCETI/), 
со ссылкой на аккаунт GLScene в проекте.

[Admin](https://t.me/astronoology)
