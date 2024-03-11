# bitmanip-test
This simple lines of code could test the bit manipulation instructions.
# Method 
To check the instruction is valid or not by compiling its c code with gnu `riscv64-unknow-elf-gcc` compiler and checking the intruction present in the genarated output file.s in corresponding directory
# Usage
cd bitmanip-test -> 
python isa-test.py ->
```enter the march```
examples:
rv64zbb_zbs_zba 
rv64zbb_zbs 
# analysis
if the instruction is found in the generated .s file,then the instruction is tested pass.otherwise if the functionality of that instruction is implemented using other instruction then that instruction is said to be tested failed
# sample output
![image](https://github.com/Vinayakamk/bitmanip-test/assets/137029135/f3a66896-8ff6-4179-9ea4-47e27b42466c)



