# %% [markdown]
""" Players generally sit in a circle. The player designated to go first says the number "1", and each player thenceforth counts one number in turn. However, any number divisible by three is replaced by the word fizz and any divisible by five by the word buzz. Numbers divisible by 15, which is both become fizz buzz. A player who hesitates or makes a mistake is eliminated from the game """.
# %%


def fizz_buzz_encode(x):
    if x % 15 == 0:
        return 3
    elif x % 5 == 0:
        return 2
    elif x % 3 == 0:
        return 1
    else:
        return 0


def fizz_buzz_decode(x):
    return ([str(x), 'fizz', 'buzz', 'fizz buzz'][fizz_buzz_encode(x)])


print(fizz_buzz_decode(2))
print(fizz_buzz_decode(3))
print(fizz_buzz_decode(5))
print(fizz_buzz_decode(15))
