import os

def create_project_directory():
    project_path = '/project'

    # Create main project directory
    if not os.path.exists(project_path):
        os.makedirs(project_path)

    # Create subdirectories
    subdirectories = ['/WEB-INF', '/pages', '/META-INF', '/WEB-INF/lib', '/WEB-INF/classes']
    for subdir in subdirectories:
        full_path = project_path + subdir
        if not os.path.exists(full_path):
            os.makedirs(full_path)

    # Create files
    create_file(project_path, 'WEB-INF/web.xml', '')
    create_file(project_path, 'index.jsp', '')
    create_file(project_path, 'pages/home.jsp', '')
    create_file(project_path, 'pages/machineList.jsp', '')
    create_file(project_path, 'pages/feedback.jsp', '')

def create_file(base_path, file_path, content):
    full_path = os.path.join(base_path, file_path)
    with open(full_path, 'w') as file:
        file.write(content)

if __name__ == "__main__":
    create_project_directory()
    print("Project directory structure created successfully.")
