## Digital Logic Design (CS203) Project
*Proposal*
>1) *Image Processing using Verilog*
>2) *Fast Fourier Transform using Verilog*


### Image Processing using Verilog (High Priority)- Approved
Image processing is an extremely versatile practical field which is already in extensive daily use. It involves the use of various filters to manipulate images into desired forms and acquire results from them.

### Use of Image Processing
Image processing is an extremely useful tool used in various domains like image recognition, medical diagnosis, entertainment and computer vision. 

### Project Scope
- [x] Research on various Image Manipulation Algorithms
- [x] We wish to implement image processing algorithms that will enable us to perform operations like inversions and brightness control. 
- [x] The program will take an image in .hex format, perform various operations on it and produce a .bmp file as the output. 

**Some of the intended operations**

![Parrots](https://4.bp.blogspot.com/-JDiUP0w0HsY/WCHQH7WzRiI/AAAAAAAAEwQ/wESf29zre8kw_OZFzVr_hY0GSxeNCpW8wCLcB/s400/Origial_image.bmp)
*Orignal Image*
___
![Inverted_Parrots](https://4.bp.blogspot.com/-WJCCVaw3gPY/WCHQHtje86I/AAAAAAAAEwU/GVZWtfNlv6wJIois2C7AoSIbbbXZA795QCEw/s400/Invert_Operation.bmp)
*Image with inverted colors*
___
![low_brightness_parrots](https://3.bp.blogspot.com/-U9Bgoycnuao/WCHSnht7yQI/AAAAAAAAEwc/8p9sU0ZIDq82VJdDvey4_3kUYIxdFME9ACLcB/s400/Brightness_Subtraction.bmp)
*Image with reduced brightness*
___


> **Refferences**
> * [The Fast Fourier Transform Algorithm by Steve Brunton](https://www.youtube.com/watch?v=toj_IoCQE-4&ab_channel=SteveBrunton)
>  * [Digital Image Processing Point Operations by All About Circuits](https://www.allaboutcircuits.com/technical-articles/digital-image-processing-point-operations/)


---
**We've not been introduced to FFT yet ,so our priority is Image Processing using Verilog.**

### Fast Fourier Transform (Low Priority)
Fast fourier transform is one of the most important algorithms created in the last century. Much of the modern technology such as wireless communication, GPS or infact anything related to the vast field of signal processing relies on the insights of FFT.

![Fast Fourier Transform](https://i.ytimg.com/vi/h7apO7q16V0/maxresdefault.jpg)

### Why FFT?
FFT saves large amounts of execution time as conventional linear algebra evaluation of Fourier Transform (DFT Algorithm) is an O(n<sup>2</sup>) algorithms where n is the number of data points (may range from 1 Million to 1 Billion in real world signals) where as FFT is an O(nlog<sub>2</sub>(n)) algorithm. Thus FFT is an almost linear algorithm in FFT.
   

### Project Scope
<!-- -->
- [x] Research on Whys' & Hows' of FFT
- [ ] Use Cooley-Tukey FFT algorithm in 2-N radix mode
- [ ] Implemnet the radix 2 butterfly module in verilog
- [ ] Simulate the developed module with testbenches for varying inputs.
- [ ] Verify results obtained in verilog with that obtained through other simulators predefined FFT functions (MATLAB/Python probably)



> **Refferences**
> * [The Fast Fourier Transform Algorithm by Steve Brunton](https://www.youtube.com/watch?v=toj_IoCQE-4&ab_channel=SteveBrunton)
>  * [The Fast Fourier Transform (FFT): Most Ingenious Algorithm Ever? by Reducible](https://www.youtube.com/watch?v=h7apO7q16V0&ab_channel=Reducible)
> * [Fast Fourier Transform- Towards Data Science](https://towardsdatascience.com/fast-fourier-transform-937926e591cb)


---
**Group Members**
| Name            | Entry Number |
| --------------- | ------------ |
| Abhijith TR     | 2020CSB1062  |
| Aditya Aggarwal | 2020CSB1066  |

*Under guidance of Dr. Neeraj Goel*
___





