#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <stdlib.h>
#include <malloc.h>
#include <math.h>
#include <assert.h>

/* Код, считывающий 'constbnd.txt' и предоставляющий полные данные о
границах созвездия, выдавая сжатое подмножество, предназначенное для
эффективной обработки данных о созвездии при соответствующих заданных RA/dec. 
При использовании границ есть нескольких альтернативных методов
решения задачи о принадлежности точки созвездию.

   Этот код должен сработать только один раз, чтобы создать сжатый
список границ в 'conbound.c' (что означает, что этот файл теперь
предназначен для интеллектуального использования / документации).

  Эта программа _ только_ генерирует компактное подмножество. Этот список
появляется в  'conbound.c' для фактического
определения в каком созвездии находится звезда с данными RA/dec.

   Входные данные с границами созвездий можно найти здесь -

https://cdsarc.cds.unistra.fr/ftp/VI/49/

   и аналогичные выходные данные доступны здесь - 

https://cdsarc.cds.unistra.fr/ftp/VI/42/

   Ссылка на статью, которая описывает тот же самый алгоритм -

https://iopscience.iop.org/article/10.1086/132034/pdf

Для определения названия созвездия, в котором находится точка (звезда) 
с заданными значениями RA/dec, нам нужен только набор "горизонтальных" 
(восток/запад) граничных линий. 
Каждая такая строка сохраняется дважды (один раз для созвездия на севере, 
один раз для созвездия на юге). Мы сохраняем только первое. Чтобы определить, 
в каком созвездии мы находимся, нам нужно смотреть на север от желаемой
точки, пока мы не достигнем границы. Выражаясь более алгоритмически, мы :

(1) Выполняем бинарный поиск по списку, чтобы найти граничный сегмент к северу от
данного SPD.
(2) Проверяем, охватывает ли диапазон RA этого сегмента данный RA. Если да, 
то мы нашли созвездие.
(3) Если нет, то возвращаемся к предыдущему (более северному) сегменту и
переходим опять к п.(2).

Для некоторых районов Малой Медведицы нет сегмента к северу, и
мы просто пройдем по кругу до вершины списка и скажем: "мы должны быть в
UMi". (Задним числом я мог бы добавить фиктивный сегмент в dec +91
, работающий от RA 0 до 24. Но я этого не сделал, и это крошечная разница.)
Также требуются некоторые небольшие биты дополнительной логики для обработки "
нулевого меридиана" при RA =0/24h.

   Полученный список отсортирован в порядке уменьшения
расстояния до южного полюса (мы используем SPD вместо dec, чтобы все величины были
положительными), а дубликаты удалены.

   Есть несколько нюансов в том, как выделяются границы.
Рассмотрим следующее (воображаемое) созвездие Джо :

                   |
  ---A--------B    |
     |        |    |
     H        C----D--E----
     |                |
     |   Joe          |
     |                |
 ----F-------+--------G----+
             |             |
   Alice     |    Bob

   Для этого созвездия мы бы извлекли сегменты AB, CD и DE.
(Горизонтальные сегменты F+ и +G будут применены к созвездиям
Alice and Bob.)  CD и DE могут быть объединены в один сегмент.

   Менее очевидно, что CD может быть расширен до H; то есть, если вы находитесь к
югу от HE, вы находитесь в пределах Joe. Это дополнение не является необходимым,
но слегка сокращает время, необходимое для идентификации.

   Далее, возникает проблема эффективного хранения данных в памяти. Все границы
имеют SPD, которые приходятся на целые угловые минуты, и лучи, которые приходятся на
целые секунды RA. Таким образом, SPD сегмента может умещаться в 14 битах, а
западный (минимальный) RA - в 17 битах; мы можем поместить и то, и другое в 32-битное
целое число. Разница между восточным RA и западным RA для сегмента
может поместиться в 16-битное целое число. Как показано в 'conbound.c', это позволяет нам уместить
все в семь байт на сегмент. Это будет почти равномерно
округлено до восьми байт для выравнивания, поэтому таблица требует 324*8 =
2592 байт.  Вероятно, мы могли бы сделать еще лучше, но код стал бы менее понятным */

typedef struct
   {
   int16_t spd;      /* in arcminutes */
   int32_t min_ra, max_ra;   /* in seconds */
   char constell_idx;      /* from 0 to 87 */
   } constbnd_t;

typedef struct
   {
   int32_t x, y;
   } point_t;

constbnd_t *bounds;
int n_bounds = 0;

const char *constell_names =
        "AndAntApsAqlAqrAraAriAurBooCaeCamCapCarCasCenCepCetChaCirCMaCMiCnc"
        "ColComCrACrBCrtCruCrvCVnCygDelDorDraEquEriForGemGruHerHorHyaHyiInd"
        "LacLeoLepLibLMiLupLynLyrMenMicMonMusNorOctOphOriPavPegPerPhePicPsA"
        "PscPupPyxRetSclScoSctSerSexSgeSgrTauTelTrATriTucUMaUMiVelVirVolVul";

static void dump_lines( const int n_pts, const point_t *p, const int constell_idx)
{
   int i, j;

   for( i = 0; i < n_pts - 1; i++)
      if( p[i].y == p[i + 1].y && p[i].x < p[i + 1].x)
         {
         int32_t max_ra = 49 * 3600, min_ra = -max_ra;
         int32_t spd0 = p[i].y, ra0 = p[i].x;

         for( j = 0; j < n_pts - 1; j++)
            if( p[j].x == p[j + 1].x)   /* vertical line */
               {
               int32_t ra1 = p[j].x;

               while( ra1 + 43200 < ra0)
                  ra1 += 86400;
               while( ra1 - 43200 > ra0)
                  ra1 -= 86400;
               if( p[j].y < spd0 && p[j + 1].y >= spd0)     /* north heading */
                  if( ra1 <= ra0 && ra1 > min_ra)
                     min_ra = ra1;
               if( p[j].y >= spd0 && p[j + 1].y < spd0)     /* south heading */
                  if( ra1 > ra0 && ra1 < max_ra)
                     max_ra = ra1;
               }
         if( min_ra >= 86400)
            {
            min_ra -= 86400;
            max_ra -= 86400;
            }
         if( min_ra < 0)
            {
            min_ra += 86400;
            max_ra += 86400;
            }
         if( spd0 == 300)      /* dec = -85; Octans; full circle */
            {                  /* A few special cases here... */
            min_ra = 0;
            max_ra = 24 * 60 * 60;
            }
         if( spd0 == 450)      /* dec = -82.5; Octans; 7h40m to 3h30m (=27h30m) */
            {
            min_ra = (7 * 60 + 40) * 60;
            max_ra = (27 * 60 + 30) * 60;
            }
         bounds[n_bounds].spd = spd0;
         bounds[n_bounds].min_ra = min_ra;
         bounds[n_bounds].max_ra = max_ra;
         bounds[n_bounds].constell_idx = (char)constell_idx;
         if( max_ra - min_ra > 65000)     /* long spans require splitting */
            {
            bounds[n_bounds + 1] = bounds[n_bounds];
            bounds[n_bounds + 1].min_ra = bounds[n_bounds].max_ra
                        = (min_ra + max_ra) / 2;
            n_bounds++;
            }
         n_bounds++;
         }
}

int main( const int argc, const char **argv)
{
   FILE *ifile = fopen( "constbnd.dat", "rb");
   char buff[100];
   int i, j;
   point_t *p = (point_t *)calloc( 1000, sizeof( point_t));

   bounds = (constbnd_t *)calloc( 2000, sizeof( constbnd_t));
   assert( ifile);
   while( fgets( buff, sizeof( buff), ifile))
      {
      char constell[4];
      int n_pts = 1, shift_24 = 0, constell_idx = -1;

      memcpy( constell, buff + 24, 3);
      constell[3] = '\0';
      for( i = 0; i < 88; i++)
         if( !memcmp( constell_names + i * 3, constell, 3))
            constell_idx = i;
      assert( constell_idx >= 0);
      p[0].x = (int32_t)( atof( buff) * 3600. + 0.5);
      p[0].y = (int32_t)( atof( buff + 12) * 60. + 5400.5);
      while( fgets( buff, sizeof( buff), ifile) && !memcmp( buff + 24, constell, 3))
         {
         int remove_pt = 0;
         point_t *tptr = p + n_pts;

         tptr->x = (int32_t)( atof( buff) * 3600. + 0.5);
         tptr->y = (int32_t)( atof( buff + 12) * 60. + 5400.5);
         if( tptr->x - tptr[-1].x > 43200)
            tptr->x -= 86400;
         if( tptr->x - tptr[-1].x < -43200)
            tptr->x += 86400;
         if( tptr->x < 0)
            shift_24 = 1;
         if( n_pts >= 2)
            {
            if( tptr[-2].x == tptr[-1].x && tptr[-1].x == tptr->x)
               remove_pt = 1;       /* all collinear horizontally */
            if( tptr[-2].y == tptr[-1].y && tptr[-1].y == tptr->y)
               remove_pt = 1;       /* all collinear vertically */
            }
         if( remove_pt)
            tptr[-1] = tptr[0];
         else
            n_pts++;
         }
      if( memcmp( constell, "Vul", 3))
         fseek( ifile, -strlen( buff), SEEK_CUR);
      printf( "Constell %s\n", constell);
      if( shift_24)
         for( i = 0; i < n_pts; i++)
            p[i].x += 86400;
      for( i = 0; i < n_pts; i++)
         printf( "%9.5f %+09.5f\n",
                  (double)p[i].x / 3600.,
                  (double)p[i].y / 60. - 90.);
      dump_lines( n_pts, p, constell_idx);
      }
   fclose( ifile);
   free( p);
   printf( "%d bounds found\n", n_bounds);
            /* Sort by decreasing dec.  No need to be efficient here. */
   for( i = 0; i < n_bounds - 1; i++)
      if( i >= 0)
         if( bounds[i + 1].spd > bounds[i].spd
                  || (bounds[i + 1].spd == bounds[i].spd && bounds[i + 1].min_ra > bounds[i].min_ra))
            {
            const constbnd_t temp = bounds[i + 1];

            bounds[i + 1] = bounds[i];
            bounds[i] = temp;
            i -= 2;
            }
   for( i = j = 1; i < n_bounds; i++)     /* remove duplicates */
      if( memcmp( bounds + i, bounds + i - 1, sizeof( bounds[0])))
         bounds[j++] = bounds[i];
   n_bounds = j;
   printf( "%d bounds found after removing duplicates\n", n_bounds);
           /* Output boundary list in human-readable form */
   for( i = 0; i < n_bounds; i++)
      printf( "Line at dec %+09.5f, RA %9.5f to %9.5f : %.3s\n",
                  (double)bounds[i].spd / 60. - 90.,
                  (double)bounds[i].min_ra / 3600.,
                  (double)bounds[i].max_ra / 3600.,
                  constell_names + bounds[i].constell_idx * 3);
           /* Output boundary list as a C array;  see conbound.c */
   for( i = 0; i < n_bounds; i++)
         printf( "    { 0x%08lx, 0x%04lx, %2d },   /* %.3s */\n",
                  (unsigned long)bounds[i].min_ra | ((unsigned long)bounds[i].spd << 17),
                  (unsigned long)(bounds[i].max_ra - bounds[i].min_ra),
                  (int)bounds[i].constell_idx,
                  constell_names + 3 * bounds[i].constell_idx);
   free( bounds);
   return( 0);
}
