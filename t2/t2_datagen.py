#!/usr/bin/python
#
#    lab_datagen: script to generate lab assignment data
#
#    FOLLOW THE COMMENTS IN CAPITALS BELOW TO EDIT THIS SCRIPT FOR A NEW QUIZ


import math
import random
import sys


my_array = list()

class Var:
    def __init__(self, name, val, tol):
        self.name = name;
        self.val = val + random.random()*(val*float(tol)/100)
        
    def printVar(self):
        global my_array
        my_array.append(self)
        print self.name, "=", self.val, "\n",
        
class Prob:
    def __init__(self, number, weight):
        self.number = number
        self.varList = []
        self.weight = weight
        
    def printProb(self):
        print "Values: \n",
        for i in range(len(self.varList)):
            self.varList[i].printVar()
        print "\n\n"
            
    def addVar(self, var):
        self.varList.append(var)

class DataSet:
    def __init__(self, number):
        random.seed(number)
        self.probList = []

        #ENTER ERROR TOLERANCE IN % FOR ANSWERS 
        self.errtol = 1 
        
        #
        #ADD PROBLEMS AND THEIR VARIABLES HERE
        #
        
        self.prob = Prob(1, 1) #problem number and weight in mark
        self.prob.addVar(Var("R1", 1, 5)) #var name, value, variation in %
        self.prob.addVar(Var("R2", 2, 5))
        self.prob.addVar(Var("R3", 3, 5))
        self.prob.addVar(Var("R4", 4, 5))
        self.prob.addVar(Var("R5", 3, 5))
        self.prob.addVar(Var("R6", 2, 5))
        self.prob.addVar(Var("R7", 1, 5))
        self.prob.addVar(Var("Vs", 5, 5))
        self.prob.addVar(Var("C",  1, 5))
        self.prob.addVar(Var("Kb", 7, 5))
        self.prob.addVar(Var("Kd", 8, 5))

        self.probList.append(self.prob)
    
    def printDataSet(self):
        nprobs = len(self.probList)
        print "Units for the values: V, mA, kOhm, mS and uF\n\n"
        for i in range(nprobs):
            self.probList[i].printProb()

def main():
    #init test
    #number = input("\n\nPlease enter the lowest student number in your group: \n")
    number = 0
    def f(x):
        x=x.lower()
        return {
            'y': 1,
            'yes': 1,
            'n': 0,
            'no': 0
        }.get(x, 2)
    while(1):
        #print("Poggers")
        number = raw_input("\n\nDo you want to use the default data (96502)? (Y-yes, N-no) \n")
        x = f(number)
        if(x==1):
                print
                print
                dataset = DataSet(96502)
                dataset.printDataSet()
                break
        if(x==0):
            data_number = raw_input("\n\nPlease enter the lowest student number in the group: \n")
            print
            print
            dataset = DataSet(int(data_number))
            dataset.printDataSet()
            break
        if(x==2):
            print("Invalid input.")
    global my_array
    f = open("./sim/data1.txt", "w")
    f.write("Vs 1 GND "+ str(my_array[7].val)+" ac 1.0 0\n")
    f.write("C1 6 8 "+str(my_array[8].val)+"u ic=0V\n")
    f.write("R1 1 2 "+str(my_array[0].val)+"k\n")
    f.write("R2 3 2 "+str(my_array[1].val)+"k\n")
    f.write("R3 2 5 "+str(my_array[2].val)+"k\n")
    f.write("R4 5 GND "+str(my_array[3].val)+"k\n")
    f.write("R5 5 6 "+str(my_array[4].val)+"k\n")
    f.write("R6 GND 6.5 "+str(my_array[5].val)+"k\n")
    f.write("VAux 6.5 7 0\n")
    f.write("R7 7 8 "+str(my_array[6].val)+"k\n")   
    f.write("Hd 5 8 VAux "+str(my_array[10].val)+"k\n")
    f.write("Gb 6 3 (2,5) "+str(my_array[9].val)+"m\n")
    f.close()
    #####################################################
    f = open("./sim/data2.txt", "w")
    f.write("Vs 1 GND 0 ac 1.0 0\n")
    f.write("R1 1 2 "+str(my_array[0].val)+"k\n")
    f.write("R2 3 2 "+str(my_array[1].val)+"k\n")
    f.write("R3 2 5 "+str(my_array[2].val)+"k\n")
    f.write("R4 5 GND "+str(my_array[3].val)+"k\n")
    f.write("R5 5 6 "+str(my_array[4].val)+"k\n")
    f.write("R6 GND 6.5 "+str(my_array[5].val)+"k\n")
    f.write("VAux 6.5 7 0\n")
    f.write("R7 7 8 "+str(my_array[6].val)+"k\n")   
    f.write("Hd 5 8 VAux "+str(my_array[10].val)+"k\n")
    f.write("Gb 6 3 (2,5) "+str(my_array[9].val)+"m\n")
    #f.write("C1 6 8 "+str(my_array[8].val)+"u ic=0V\n") adicionar next
    f.close()
    #####################################################
    f = open("./sim/data3.txt", "w")
    f.write("Vs 1 GND 0 ac 1.0 0\n")
    f.write("R1 1 2 "+str(my_array[0].val)+"k\n")
    f.write("R2 3 2 "+str(my_array[1].val)+"k\n")
    f.write("R3 2 5 "+str(my_array[2].val)+"k\n")
    f.write("R4 5 GND "+str(my_array[3].val)+"k\n")
    f.write("R5 5 6 "+str(my_array[4].val)+"k\n")
    f.write("R6 GND 6.5 "+str(my_array[5].val)+"k\n")
    f.write("VAux 6.5 7 0\n")
    f.write("R7 7 8 "+str(my_array[6].val)+"k\n")   
    f.write("Hd 5 8 VAux "+str(my_array[10].val)+"k\n")
    f.write("Gb 6 3 (2,5) "+str(my_array[9].val)+"m\n")
    #f.write("C1 6 8 "+str(my_array[8].val)+"u ic=0V\n") adicionar next
    f.close()
    #####################################################
    f = open("./sim/data45.txt", "w")
    f.write("Vs 1 GND 0 ac 1.0 0 sin(0 1.0 1k)\n")
    f.write("R1 1 2 "+str(my_array[0].val)+"k\n")
    f.write("R2 3 2 "+str(my_array[1].val)+"k\n")
    f.write("R3 2 5 "+str(my_array[2].val)+"k\n")
    f.write("R4 5 GND "+str(my_array[3].val)+"k\n")
    f.write("R5 5 6 "+str(my_array[4].val)+"k\n")
    f.write("R6 GND 6.5 "+str(my_array[5].val)+"k\n")
    f.write("VAux 6.5 7 0\n")
    f.write("R7 7 8 "+str(my_array[6].val)+"k\n")   
    f.write("Hd 5 8 VAux "+str(my_array[10].val)+"k\n")
    f.write("Gb 6 3 (2,5) "+str(my_array[9].val)+"m\n")
    #f.write("C1 6 8 "+str(my_array[8].val)+"u ic=0V\n") adicionar next
    f.close()
    f = open("./sim/dataExtra.txt", "w")
    f.write(str(my_array[8].val))
    f.close()
if __name__ == "__main__": main()

