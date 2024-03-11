import os
import subprocess
import logging

passed_instructions = set()

def execute(file_path, xlen, extensions):
    global passed_instructions
    
    for extension in extensions.split('_'):
        output_dir = os.path.join("output", extension)
        os.makedirs(output_dir, exist_ok=True)

        filename = os.path.basename(file_path)

        if xlen in filename:
            output_file = file_path.replace('src','output').replace(".c", ".s")#os.path.join(output_dir, filename.replace(".c", ".s"))

            compiler = f"riscv{xlen}-unknown-elf-gcc"

            logging.info(f"Input file: {file_path}")
            logging.info(f"Output file: {output_file}")

            command = f"{compiler} -march=rv64gc_zba_zbb_zbc_zbs -S -O2 -o {output_file} {file_path}"
            try:
                subprocess.run(command, shell=True, check=True)
                logging.info(f"Compilation successful: {file_path} -> {output_file}")

                instr_name = os.path.basename(output_file).split(xlen)[0].rstrip('_')
                if instr_name not in passed_instructions:
                    logging.info(f"\033[92mThe instruction {instr_name} is PASSED\033[0m")
                    passed_instructions.add(instr_name)
                else:
                    logging.error(f"\033[91mThe instruction {instr_name} is FAILED\033[0m")
                    passed_instructions.add(instr_name)
            except subprocess.CalledProcessError as e:
                logging.error(f"\033[91mCompilation failed: {file_path}. Error: {e}")


def main():
    logging.basicConfig(level=logging.INFO)

    march = input("Enter the march: ")
    xlen = march[2:4]
    extensions = march[4:]

    src_dir = "src" # Assuming source files are in the 'src' directory
    for root, dirs, _ in os.walk(src_dir):
        for dir_name in dirs:
            if dir_name in extensions:
                dir_path = os.path.join(root, dir_name)
                for instr_dir in os.listdir(dir_path):
                    instr_path = os.path.join(dir_path, instr_dir)
                    for file in os.listdir(instr_path):
                        if file.endswith('.c'):
                            file_path = os.path.join(instr_path, file) # Full path of the source file
                            execute(file_path, xlen, extensions)

if __name__ == "__main__":
    main()

