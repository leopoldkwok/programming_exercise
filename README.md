# Programming Exercise

Technologies used
------------------

* Ruby
* Rspec

How was it developed?
---------------------
It started with creating the vending machine class with products and coins.coins. This was later split into their own classes:

- Vending machine (holds the main logic)
- Product
- Coins

The vending machine is initialized with products such as (Tango, Pepsi and KitKat) with their prices and quantities in the machine. Also, the machine has available coins in the UK denomination of (1p, 2p, 5p, 10p, 20p, 50p, £1 and £2). 

The vending machine keeps track of when a product is selected and removed and returns the appropriate change to the user.

How to use
-----------

Clone the repository:

```shell
$ git clone git@github.com:leopoldkwok/programming_exercise.git
```

Change into the directory:

```shell
$ cd programming_exercise
```

How to run the tests:

```shell
$ rspec
```

Design a vending machine in code. The vending machine should perform as follows:

Once an item is selected and the appropriate amount of money is inserted, the vending machine should return the correct product.

It should also return change if too much money is provided, or ask for more money if insufficient funds have been inserted.

The machine should take an initial load of products and change. The change will be of denominations 1p, 2p, 5p, 10p, 20p, 50p, £1, £2.

There should be a way of reloading either products or change at a later point.

The machine should keep track of the products and change that it contains.
Design a vending machine in code. The vending machine should perform as follows:

Once an item is selected and the appropriate amount of money is inserted, the vending machine should return the correct product.

It should also return change if too much money is provided, or ask for more money if insufficient funds have been inserted.

The machine should take an initial load of products and change. The change will be of denominations 1p, 2p, 5p, 10p, 20p, 50p, £1, £2.

There should be a way of reloading either products or change at a later point.

The machine should keep track of the products and change that it contains.

