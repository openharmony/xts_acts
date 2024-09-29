import os  
import glob  
import shutil  
  
def replace_hvigor_bat(directory):  
    # 获取当前目录下的 hvigorw.bat 文件路径和内容  
    current_hvigor_path = os.path.join(directory, 'hvigorw.bat')  
    if not os.path.exists(current_hvigor_path):  
        print("当前目录没有 hvigor.bat 文件。")  
        return  
  
    with open(current_hvigor_path, 'r') as file:  
        current_hvigor_content = file.read()  
  
    # 遍历当前目录及其同级目录  
    for root, dirs, files in os.walk(directory):  
        # 查找BUILD.gn文件  
        build_gn_files = glob.glob(os.path.join(root, '*.gn'))  
        for gn_file in build_gn_files:  
            if os.path.basename(gn_file) == 'BUILD.gn':  
                # 定位到含有BUILD.gn的同级目录的 hvigorw.bat 文件  
                target_hvigor_path = os.path.join(os.path.dirname(gn_file), 'hvigorw.bat')  
                if os.path.exists(target_hvigor_path):  
                    # 替换内容  
                    with open(target_hvigor_path, 'w') as file:  
                        file.write(current_hvigor_content)  
                    print(f"已替换：{target_hvigor_path}")  
                else:  
                    print(f"未找到：{target_hvigor_path}")  
  
# 调用函数，传入要搜索的顶级目录  
replace_hvigor_bat('./')