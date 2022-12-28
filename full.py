from random import randint

for x in range(1, 20+1):
    filename = 'input' + str(x) + '.txt'
    with open(filename, 'w') as file:
        for i in range(654*140):
            file.write(str(randint(0, 256)) + '\n')

