#Division without using the division operator
import random

def division(a, b):
    if (b == 0):
        raise ValueError("Cannot divide by 0")
    if (b == 1):
        return [a, 0]
    
    q = 0
    s = 0
    while (s < a):
        q += 1
        s += b
    
    if a-s == 0:
        return [q, 0]
    return [(q-1), a-s+b]
        
def div_test():
    for i in range(1, 10000):
        a = random.randint(1, 999999999)
        b = random.randint(1, 999999999)
        check_result = division(a, b)
        actual_result = [a // b, a % b]
        if (check_result != actual_result):
            print("The result failed!!!")
            print(a, b)
            print("Needed: ", actual_result)
            print("Yours: ", check_result)
            return
    print("The result was successful!!!")
    return
    
    
div_test()

    
