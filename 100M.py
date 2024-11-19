import os
import shutil

def get_file_size(file_path):
    return os.path.getsize(file_path)

def create_folder(folder_name):
    if not os.path.exists(folder_name):
        os.makedirs(folder_name)

def move_files_to_folder(files, folder_name):
    create_folder(folder_name)
    for file in files:
        shutil.move(file, os.path.join(folder_name, os.path.basename(file)))

def main():
    max_size = 100 * 1024 * 1024  # 100MB
    current_folder = os.getcwd()
    current_script = os.path.basename(__file__)
    files = [os.path.join(current_folder, f) for f in os.listdir(current_folder) if os.path.isfile(f) and f != current_script]
    
    folder_index = 1
    current_folder_size = 0
    current_files = []

    for file in files:
        file_size = get_file_size(file)
        if current_folder_size + file_size > max_size:
            move_files_to_folder(current_files, f'folder_{folder_index}')
            folder_index += 1
            current_folder_size = 0
            current_files = []
        
        current_files.append(file)
        current_folder_size += file_size

    if current_files:
        move_files_to_folder(current_files, f'folder_{folder_index}')

if __name__ == "__main__":
    main()
