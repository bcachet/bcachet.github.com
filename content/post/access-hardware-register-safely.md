+++
date = "2012-06-25"
title = "Access hardware register safely"
description = "Use appropriate C keywords to access registers correctly/safely"
categories = ["embedded"]
keywords = ["register", "volatile", "safety"]
+++

In embedded development, there is a task we do every day: accessing hardware via
a register mapped to a known physical memory address.

# Naive declaration

I have declared such a register for years this way:

```cpp
uint8 * p_reg = (uint8 *) 0x00080000;
```

which can be readen as **p_reg** is a **pointer** to a **8-bit unsigned integer**


You modify the content of this register this way:

```cpp
*p_reg = REG_ACTIVATE_HARDWARE;
```

Really easy, but this code can be *optimized* to take into account two aspects
of an harware register:

 * address of the register will never be modified
 * register content can be modified outside of process at any time (by hardware itself)

# Register address will not change

Indeed with the previous declaration, compiler will not warn us if we make a
typo and write the following:

```cpp
p_reg = REG_ACTIVATE_HARDWARE;
```

because we doesn't declare the pointer as constant with the **const** keyword.

```cpp
uint8 * const p_reg = (uint8 *) 0x00080000;
```

readen as **p_reg** is a **constant pointer to 8bit unsigned integer**. This
mean that you can change content of **p_reg** register but not the pointer
(address where it point). So with the last declaration, if we miss the pointer
dereference then compilation will end up with an error.


# Register is updated outside of process

Moreover when optimizing generated code with GCC we can have strange behavior.
For example, if we write some code to loop reading the register content to check
that status has been modified

```cpp
uint8 * p_reg = (uint8 *) 0x1;

// Wait for register to become non-zero
while (*p_reg == 0) { } // Do something else
```

Generated assemble code will become something like

```nasm
mov ptr, #0x1
mov a, @ptr
loop:
  bz loop
```
which en up in an infinite loop. Indeed, **p_reg** variable is set once, so GCC
optimize by not reading it every time. We should use the **volatile** keyword to
indicate that this variable can be changed at any time by outside of this process.

If the declaration use the **volatile** keyword

```cpp
uint8 volatile p_reg = (uint8 volatile *)0x1;
```

then the generated assembler (even if optimized) become something like

```nasm
mov ptr, #0x1
loop:
  mov a, @ptr
  bz loop
```


# Final declaration

I finally use the following declaration:

```cpp
uint8 volatile * const p_reg = (uint8 *) 0x00080000;
```

which can be read as **p_reg** is a **constant pointer** to a **volatile 8-bit unsigned integer** which is exactly what a register is.


### note

You can have a complete understanding of the mecanism used here reading
[Combining C's volatile and const Keywords](http://embeddedgurus.com/barr-code/2012/01/combining-cs-volatile-and-const-keywords/)
