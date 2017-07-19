On-Site Code Sample
===================

We would like to get to know your coding style and see what you would consider your best work.
In subsequent interviews, we'll talk through your code and make some changes.

CLI RPN Calculator
==================

Implement a command-line reverse polish notation (RPN) calculator using a language that you know well.

Imaginary Context
-----------------

We're building this command-line calculator for people who are comfortable with UNIX-like CLI utilities.
We are starting with the basic 4 operators now but will want to eventually implement other operators and
an alternate interface (such as WebSocket, file, or TCP socket).
There's no need to implement these, but design with these future changes in mind.

Specifications
--------------

1. The calculator should use standard input and standard output
2. It should implement the four standard arithmetic operators
3. The calculator should handle errors and recover gracefully
4. The calculator should exit when it receives a `q` command or an end of input 
   indicator (EOF / Ctrl+D)

You may take creative liberty with anything else; have fun with it!

Example Input/Output
--------------------

The format is not important, as long as it makes sense.

    > 5 
    5
    > 8
    8
    > +
    13

---

    > 5 8 +
    13.0
    > 13 -
    0.0

---

    > -3
    -3.0
    > -2
    -2.0
    > *
    6.0
    > 5
    5.0
    > +
    11.0

---

    > 5
    5
    > 9
    9
    > 1
    1
    > -
    8
    > /
    0.625

Guidelines
==========

Things We Care About
--------------------

These hold true both for this submission and for your work here in general. We expect that:

- It works right
- The code is well-abstracted and uses good names
- It provides for a good user experience (end-user and programmer)
- The code adheres to style and practices accepted by the community
- Tests demonstrate intended use, help prevent regression, and can withstand change
- You write intention-revealing commit messages

There are a range of expectations from various companies in their interviewing code exercises, from minimal code to get the job done and prove you can program, to expecting exemplary code that demonstrates how well you can design things when the occasion requires it. We tend to judge toward the latter end of the spectrum, assuming that anyone who can write well-crafted code can also scale down quality to do things quickly, but not necessarily the other way around. With a 16-year-old monolith codebase, we want people who can work with us to raise the bar of quality.

Readme
------

Write your README as if it was for a production service. Include the following items:

* A high-level description of your solution
* Reasoning behind your technical choices, including architectural
* Trade-offs you might have made, anything you left out, or what you might do differently if you were to spend additional time on the project
* How to run your code, if applicable
* Link to the hosted application, if applicable

Submitting
----------

Submit your code as a git repository (even if 1 commit). Host it on GitHub (or wherever, public or private), or send it as a zip file/tarball.
