import os

def merge_sql_files():
    current_dir = os.getcwd()  # Get the current directory
    output_file = os.path.join(current_dir, 'create_all_' + os.path.basename(current_dir) +'.sql')  # Output file path
    
    # List all files in the current directory ending with .sql
    sql_files = [file for file in os.listdir(current_dir) if file.endswith('.sql')]
    
    # Sort files to ensure they are merged in order (if necessary)
    sql_files.sort()

    # Open the output file for writing
    with open(output_file, 'w') as outfile:
        for sql_file in sql_files:
            file_path = os.path.join(current_dir, sql_file)
            # Read each SQL file and write its content to the output file
            with open(file_path, 'r') as infile:
                outfile.write(f"-- Contents of {sql_file}\n")
                outfile.write(infile.read().strip() + '\n\n')

    print(f"Merged all SQL files in {current_dir} into {output_file}")
if __name__ == "__main__":
    merge_sql_files()
