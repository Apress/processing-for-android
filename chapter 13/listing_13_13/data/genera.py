import numpy

x = numpy.random.uniform(-800, 800, size=1000)
y = numpy.random.uniform(-800, 800, size=1000)
z = numpy.random.uniform(-800, 800, size=1000)

with open("puntos.txt", "w") as of:
    for i in range(0, 1000):
        of.write(str(x[i]) + " " + str(y[i]) + " " + str(z[i]) + "\n")