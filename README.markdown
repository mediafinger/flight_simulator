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


## Second Iteration

We have Map, Airport and Airplane classes. Now it is time to combine them to have some fun flying around!

Before we can really fly, our airplane needs to be able to change it's position on the map. The speed influences how far it comes and also how much fuel it consumes. Let's say with 1 speed it passes 1 field, with 2 speed 2 fields and so on... also for every 1 speed 1 fuel is consumed.

For the sake of simplicity, our Airplane can not take any turns yet, but just fly straight. So create a Map that is only one field wide and assume the Airplane does only fly in one direction: 'north' (from small y to large y). So let's add a method `fly` that updates the **position** and the **fuel**.

The `fly` method will also save a message including the position in the new field **status**. The message should be different when the Airplane is flying than when it is grounded.

Let's write a class **Flying** that creates a Map with two Airports and initializes an Airplane on the first Airport. Add a method **fly** that will take a list of commands - where every command is either one of the Airplane methods "take_off", "accelerate", "slow_down", "touchdown" or the String "keep_going". If "keep_going" is the current command, than flying.fly will only call @airplane.fly - otherwise it will first call the command on the Airplane and then call fly on it. Use `@airplane.public_send(command)` to execute a String as a command on @airplane.

 Flying.fly also checks if the plane is grounded on a field that is not an Airport. In this case the Airplane it should be marked as **crashed**, and no further commands should be accepted.

 If all commands have been executed and the Airplane is no longer flying and is on an Airport than the return value of flying.fly should be "It is safe on the ground."


## Third Iteration

It is time our Airplane learns how to take some turns. To keep it simple we will only do 90° turns for now. So let's add an instance variable **direction** that returns one of the values [:N, :E, :S, :W] and add the methods `turn_right` and `turn_left`.

We can now make the Map wider. And we should add validations that all Airports and the Airplane is always on the Map. For now let's exit the program with an error message, if the Airplane leaves the Map.


