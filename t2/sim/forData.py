#!/usr/bin/python
#
#    lab_datagen: script to generate lab assignment data
#
#    FOLLOW THE COMMENTS IN CAPITALS BELOW TO EDIT THIS SCRIPT FOR A NEW QUIZ


def main():
    V6=0
    V8=0
    V =list()
    C=0
    f = open("dataExtra.txt", "r")
    for line in f:
        value = line.strip().split()
    C=float(value[0])
    print(C)
    f.close()

    f = open("V_68.txt", "r")
    for line in f:
        value = line.strip().split()
        V.append(float(value[2]))
    V6=V[0]
    V8=V[1]
    f.close()


    f = open("data2.txt", "a")
    f.write("Vx 6 8 "+str(V6-V8))
    f.close()

    f = open("data3.txt", "a")
    f.write("C1 6 8 "+str(C)+"u ic="+str(V6-V8)+"V")
    f.close()

    f = open("data45.txt", "a")
    f.write("C1 6 8 "+str(C)+"u ic="+str(V6-V8)+"V")
    f.close()
    


if __name__ == "__main__": main()


