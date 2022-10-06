---
categories: []
layout: post
title: Pandas (Python)
created: 1453922499
redirect_from: /content/pandas-python
---
I'm learning the Pandas library for Python.  Here are some note.
## Series

* General form:
    * `pandas.Series(data=None, index=None)`
* Example:
    * `pandas.Series(['big', 'small', 'red', 42])`
* Example:
    * `pandas.Series(data=['big', 'small', 'red', 42], index=['desired_wealth', 'actual_wealth', 'status', 'answer'])`
* Getting data out of a Series:
    * `x = series['status']`
* Getting multiple data out:
    * `y = series[['status','answer']]`
* Get a sub-series, where the value is transformed (in this case: multiplied by 3).  Returns a series:
    * `z = seriesName * 3`
* Get sub-series from a series where value meets  a condition (in this case: != 3).  Returns a series:
    * `zz = seriesName[seriesName != 3]`

## DataFrame 

* General form:
    * `pandas.DataFrame(data=None)`
* Example:
    * ```pandas.DataFrame({
            'year': [2010, 2011, 2012, 2011, 2012, 2010, 2011, 2012],
            'team': ['Bears', 'Bears', 'Bears', 'Packers', 'Packers', 'Lions',
                     'Lions', 'Lions'],
            'wins': [11, 8, 10, 15, 11, 6, 10, 4],
            'losses': [5, 8, 6, 1, 5, 10, 6, 12]})```
* Functions/selectors you can call on a DataFrame named d:
    * d.dtypes - what is the data type of each column
    * d.describe() - show some aggregated metrics about the values in the data frame
    * d.head() - show the first few rows
    * d.tail() - show the last few rows
    * d.head(2) - show the firs 2 rows
* Load a CSV file:
    * d = `pandas.read_csv('./file1.csv')`
* Create a data frame from a literal:
```
    my_cars = ['Prius', 'Corolla', 'Matchbox']
    horsepower = [120, 130, 0]
    colors = ['gold', 'silver', 'rainbow']
    t = DataFrame({
        'my_cars':Series(my_cars),
        'horsepower':Series(horsepower),
        'color':Series(colors)
        })
```
* Create a data frame from a literal, with an index:
```
    d = DataFrame({
        'one':Series([1, 2, 3], index=['a','b','c']),
        'two':Series([1, 2, 3], index=['a','b','c'])
        })
```
* Get a column from a data frame:
    * Treat it like a dictionary: 
        * `x = d['columnName']`
    * Or treat it like a field: 
        * `x = d.columnName`
* Get multiple columns from a data frame:
    * `x = d[['colName1', 'colName2']]`
* Get a row from a data frame:
    * `d.loc[index]`
    * `d.loc[3]`
    * `d.loc['namedIndex']`
* Select rows from a data frame that meet a criteria:
    * `d[d['horsepower'] >= 120]`
* Get rows 3-5 (Note: Last number is strictly less than)
    * `d[3:6]`
* Select and project (one column)
    * d['color'][d['horsepower'] >= 120]
* Select and project (multiple columns)
    * d[['color','horsepower']][d['horsepower'] >= 120]
        * The boolean test return all the indices meeting that criteria.  Then those indices are used to select the rows from the color+horsepower intermediate data frame.
* Apply a function to every column:
    * `d.apply(numpy.median)`
* Apply a function to each value one column:
    * `d['colName'].map(lambda x: x+1)`
* Apply a function to every value in every row and column
    * `d['colName'].applymap(lambda x: x+1)`
* Apply an aggregate function to a column:
    * `numpy.mean(d['horsepower'])`

## Matrix Multiply Example From Udacity Course

<code type="python">
<pre>
import numpy
from pandas import DataFrame, Series

def numpy_dot():
    '''
    4 points for gold, 2 points per silver, one point per bronze.
    Using the numpy.dot function, return a new dataframe with
        a) a column called 'country_name' with the country name
        b) a column called 'points' with the total number of points the country earned.
    '''
    countries = ['Russian Fed.', 'Norway', 'Canada', 'United States',
                 'Netherlands', 'Germany', 'Switzerland', 'Belarus',
                 'Austria', 'France', 'Poland', 'China', 'Korea', 
                 'Sweden', 'Czech Republic', 'Slovenia', 'Japan',
                 'Finland', 'Great Britain', 'Ukraine', 'Slovakia',
                 'Italy', 'Latvia', 'Australia', 'Croatia', 'Kazakhstan']
    gold = [13, 11, 10, 9, 8, 8, 6, 5, 4, 4, 4, 3, 3, 2, 2, 2, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0]
    silver = [11, 5, 10, 7, 7, 6, 3, 0, 8, 4, 1, 4, 3, 7, 4, 2, 4, 3, 1, 0, 0, 2, 2, 2, 1, 0]
    bronze = [9, 10, 5, 12, 9, 5, 2, 1, 5, 7, 1, 2, 2, 6, 2, 4, 3, 1, 2, 1, 0, 6, 2, 1, 0, 1]

    d = DataFrame({
        'country_name':Series(countries), 
        'gold':Series(gold),
        'silver':Series(silver),
        'bronze':Series(bronze)
        })[['gold','silver','bronze']]
    v = numpy.dot(d,[4,2,1])
    return DataFrame({
        'country_name':Series(countries),
        'points':Series(v)  })
</pre>
</code>

