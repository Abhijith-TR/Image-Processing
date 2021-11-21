import os
import tkinter
from tkinter import filedialog

root = tkinter.Tk()

dirname = filedialog.askopenfilename(filetypes=(("Image File","*.bmp"),),title = "Select your image") #select the required image

print("Image conversion has started")

os.rename(dirname,r"C:\Users\ADMIN\Downloads\CS203-Project\new.bmp")        #Moves the file to the working directory

os.startfile(r"C:\Users\ADMIN\Downloads\CS203-Project\Image_conversion.m")      #Opens the MATLAB file for conversion into .hex format

t = input()

os.chdir(r"C:\Users\ADMIN\Downloads\CS203-Project")  #Change the working directory to CS203_Final

print("Image has been converted from BMP to HEX")

print("The choices available for image manipulation are :")
print("1. Inversion\n2. Grayscale and mirror\n3. Brightness Increase")
print("4. Brightness reduction\n5. Threshold\n6. Mirror and flip\n7. Change the image")

while (True) :
    x = int(input("Enter your choice: "))
    if (x==1):
        os.system("iverilog.exe inversion.v")   #Run the commands in a subshell using os.system commands
        os.system("vvp a.out")
        print("Processing done!")
        os.startfile("Hex_to_BMP.m")
        input()     #Enter input to move on to the next operation
    elif (x==2):
        os.system("iverilog.exe main.v")
        os.system("vvp a.out")
        print("Processing done!")
        os.startfile("hex_bmp.m")
        input()
    elif (x==3):
        os.system("iverilog.exe brightness_i.v")
        os.system("vvp a.out")
        print("Processing done!")
        os.startfile("Hex_to_BMP.m")
        input()
    elif (x==4):
        os.system("iverilog.exe brightness_d.v")
        os.system("vvp a.out")
        print("Processing done!")
        os.startfile("Hex_to_BMP.m")
        input()
    elif (x==5):
        os.system("iverilog.exe threshold.v")
        os.system("vvp a.out")
        print("Processing done!")
        os.startfile("Hex_to_BMP.m")
        input()
    elif (x==6):
        os.system("iverilog.exe flip_up.v")
        os.system("vvp a.out")
        print("Processing done!")
        os.startfile("Hex_to_BMP.m")
        input()
    elif (x==7):
        os.system("del new.bmp")
        dirname = filedialog.askopenfilename(filetypes=(("Image File","*.bmp"),),title = "Select your image")
        os.rename(dirname,r"C:\Users\ADMIN\Downloads\CS203-Project\new.bmp")
        os.startfile(r"C:\Users\ADMIN\Downloads\CS203-Project\Image_conversion.m")
        print("The image is being converted to hex")
        input()
    elif (x==-1):
        break
        



