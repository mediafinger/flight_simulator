# Flight Simulator

In this exercise you will create a flight simulator! Don't worry (or don't be too disappointed) there won't be any fancy graphics.

The idea is to let a plane fly over a map and land and start at airports. First this will only happen in the tests (so hey, you can work test-driven!). Then you might want to write a program that let's the plane fly a fixed route. Afterwards you can make this program dynamic through randomization and a simple artificial intelligence. As a last step for this exercise we can build a command line interface to steer an airplane interactively.

Bonus tasks:
 - add a multiplayer mode
 - display the map with airports and airplanes
 - display it in the browser
 - create a mulitplayer mode that works ofer the network

;-)

## First Iteration

Let's first set up the basics. Read the tasks, then make the tests green __one by one__. Just fulfill the requirements - and use the same names! The tests are already written, so you just have to make them pass.

### Running the tests:

Use Ruby 2.1.x or newer and install the latest version with `gem install minitest`

Read more about it: https://github.com/seattlerb/minitest

- to run one file: `ruby -Ilib:test test/map_test.rb`
- to run one test: `ruby -Ilib:test test/map_test.rb --name test_width_is_set`

I also added a `Rakefile` which enables you to run all the tests at once:

- `rake test` :-)

### The Map

  - create a **Map** class with **height** and **width** attributes

### The Airports

  - create a **Airport** class with **x** and **y** attributes for the position
  - add a method `position` in the Airport class that returns the coordinates

### The Airplane

  - create an **Airplane** class with attributes for `position` (**x** and **y**), **flying**, **speed** and **fuel**
  - in the setters of speed validate it is between 0 and 10 (do not raise an error)
  - add a method `accelerate` that increments the speed by 2
  - add a method `slow_down` that decrements the speed by 1
  - add a method `take_off` that changes the value of flying to true and accelerates
  - add a method `touchdown` that changes the value of flying to false and calls slow_down

