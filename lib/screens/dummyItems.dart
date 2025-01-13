import 'package:flutter/material.dart';
import 'package:updatedrestorentapp/Model/Categories.dart';
import 'package:updatedrestorentapp/Model/Items.dart';


var availablemeals=[
  Categories(id: 'c1', tittle: 'Italin',color:Color.fromRGBO(127, 330, 110, 1)),
  Categories(id: 'c2', tittle: 'Quick & Easy',color: Color.fromRGBO(127, 33, 140, 1)),
  Categories(id: 'c2', tittle: 'Hamburger',color: Color.fromRGBO(181, 55, 46, 1)),
  Categories(id: 'c4', tittle: 'German',color: Color.fromRGBO(194, 118, 0, 1)),
  Categories(id: 'c5', tittle: 'Light and Lovely',color: Color.fromRGBO(193, 146, 0, 1)),
  Categories(id: 'c6', tittle: 'Exotic',color: Color.fromRGBO(34, 116, 184, 1)),
  Categories(id: 'c7', tittle: 'Breakfast',color: Color.fromRGBO(62, 125, 61, 1)),
  Categories(id: 'c8', tittle: 'Asian',color: Color.fromRGBO(0, 130, 183, 1)),
  Categories(id: 'c9', tittle: 'French',color: Color.fromRGBO(107, 146, 60, 1)),
  Categories(id: 'c10', tittle: 'Summer',color: Color.fromRGBO(185, 28, 80, 1))
];


var dummyitems=[
  Items(id: 'm1',
      url: 'https://www.holidify.com/images/cmsuploads/compressed/78117-wienerschnitzel-ddmfs-3X4-0200-ec06b882b575486ab7398957709413d2_20230220153222.jpg',
      tittle: 'Schnitzel',
      duration: '10 min',
      complexity: 'simple',
      affortability: 'Affordable',
      categories: [
        'c1',
        'c2',
        'c5'
      ],
      ingredients: [
        'Shredded rotisserie chicken',
        '6 oz. pepper Jack cheese',
        'Finely chopped chipotle pepper',
        'Tortilla chips',
      ],
      steps: [
        'Prep your ingredients',
        'Put the tray of chicken, tortillas, and cheese, into the oven, and bake until the cheese is melted and bubbly.',
        'Layer the ingredients',
        'Melt the cheese',
        'Add the toppings'
      ],
      isGlutenFree: true,
      isLactoseFree: true,
      isVegan: false,
      isVegetarian: false
  ),
  Items(id: 'm2',
      url: 'https://www.foodandwine.com/thmb/fPWGVzDqrWkN2iaekOQc3jOVnhc=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/Chicken-Scarpariello-FT-RECIPE1023-c6c5d4c72b1f4c66bd8276106447c988.jpg',
      tittle: 'Chicken Scarpariello',
      duration: '20 min',
      complexity: 'Simple',
      affortability: 'Affordable',
      categories: [
        'c2',
        'c3',
        'c1',
      ],
      ingredients: [
        'Shredded rotisserie chicken',
        '6 oz. pepper Jack cheese',
        'Finely chopped chipotle pepper',
        'Tortilla chips',
      ],
      steps: [
        'Prep your ingredients',
        'Put the tray of chicken, tortillas, and cheese, into the oven, and bake until the cheese is melted and bubbly.',
        'Layer the ingredients',
        'Melt the cheese',
        'Add the toppings'
      ],
      isGlutenFree: true,
      isLactoseFree: false,
      isVegan: false,
      isVegetarian: false),
  Items(id: 'm3',
      url: 'https://www.foodandwine.com/thmb/VySKZRCx3r2mU4-kKipOimETTT8=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/FAW-recipes-italian-wedding-risotto-hero-01-f9c6681cf49f4b958882d2fb84acc61d.jpg',
      tittle: 'Chicken Scarpariello',
      duration: '10 min',
      complexity: 'Hard',
      affortability: 'Costly',
      categories: [
        'c4',
        'c5',
        'c6',
        'c1'
      ],
      ingredients: [
        'Shredded rotisserie chicken',
        '6 oz. pepper Jack cheese',
        'Finely chopped chipotle pepper',
        'Tortilla chips',
      ],
      steps: [
        'Prep your ingredients',
        'Put the tray of chicken, tortillas, and cheese, into the oven, and bake until the cheese is melted and bubbly.',
        'Layer the ingredients',
        'Melt the cheese',
        'Add the toppings'
      ],
      isGlutenFree: false,
      isLactoseFree: false,
      isVegan: false,
      isVegetarian: false),
  Items(id: 'm4',
      url: 'https://www.foodandwine.com/thmb/R29hsuwfvCakNb9E7htyI8fgfrc=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/florentine-butter-chicken-ft-recipe0919-3fef0bddd6614a70b2fe450c11298acb.jpg',
      tittle: 'Chicken Scarpariello',
      duration: '25 min',
      complexity: 'Hard',
      affortability: 'Affordable',
      categories: [
        'c5',
        'c3',
        'c6',
        'c2',
        'c4'
      ],
      ingredients: [
        'Shredded rotisserie chicken',
        '6 oz. pepper Jack cheese',
        'Finely chopped chipotle pepper',
        'Tortilla chips',
      ],
      steps: [
        'Prep your ingredients',
        'Put the tray of chicken, tortillas, and cheese, into the oven, and bake until the cheese is melted and bubbly.',
        'Layer the ingredients',
        'Melt the cheese',
        'Add the toppings'
      ],
      isGlutenFree: false,
      isLactoseFree: false,
      isVegan: true,
      isVegetarian: false),
  Items(id: 'm5',
      url: 'https://www.foodandwine.com/thmb/dX7pNh_WX83ESqb9VJuvkBwVKwM=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/Braciole-FT-RECIPE1122-66acf49cef0e4390bec780945709e7f3.jpg',
      tittle: 'Chicken Scarpariello',
      duration: '20 min',
      complexity: 'Simple',
      affortability: 'Affordable',
      categories: [
        'c2',
        'c5',
        'c3',
        'c6',
        'c7',
        'c9',
        'c10'
      ],
      ingredients: [
        'Shredded rotisserie chicken',
        '6 oz. pepper Jack cheese',
        'Finely chopped chipotle pepper',
        'Tortilla chips',
      ],
      steps: [
        'Prep your ingredients',
        'Put the tray of chicken, tortillas, and cheese, into the oven, and bake until the cheese is melted and bubbly.',
        'Layer the ingredients',
        'Melt the cheese',
        'Add the toppings'
      ],
      isGlutenFree: false,
      isLactoseFree: true,
      isVegan: false,
      isVegetarian: true),
];

var favoriteDataList=dummyitems;