import json
import os
import sys

# precise_repo_xts = "third_party/skia"
precise_repo_xts = sys.argv[1]
DEEP = int(sys.argv[2]) if len(sys.argv) > 2 else -1
home = os.path.dirname(os.path.dirname(os.path.dirname(os.getcwd())))
manifest_home = os.path.join(home , ".repo")
preloader_path = os.path.join(home,"out","preloader")
precise_gni_name = "precise_run.gni"
depends_tree_name = "depends_tree.txt"
f_depends_name = "f_depends.txt"
MAX_PRECISE_PR_NUM = 20

# 首层依赖关系dist
dependency_dist = {}
# 全量编译白名单
whitelist = {"test/xts/acts", "build"}

def get_f_dependes_dist (path):
    count = 0
    # 遍历目录下的所有文件和子目录
    for root, dirs, files in os.walk(path):
        for file in files:
            if file == 'bundle.json':
                count = count + 1
                # 构建完整的文件路径
                file_path = os.path.join(root, file)
                # 读取 JSON 文件并转换为 Python 对象
                with open(file_path, 'r', encoding='utf-8') as f:
                    json_data = json.load(f)
                    bundle_name = json_data['name'].split('/')[-1]
                    if "deps" not in json_data['component']:
                        continue
                    deps = json_data['component']['deps']
                    # 依赖关系额写入dependency_dist
                    if bundle_name not in dependency_dist:
                        dependency_dist[bundle_name] = []
                    if "components" in deps:
                        components_defs = deps['components']
                        for c_def in components_defs:
                            if c_def in dependency_dist:
                                dependency_dist[c_def].append(bundle_name)
                            else:
                                dependency_dist[c_def] = [bundle_name]
                    if "third_party" in deps:
                        third_party_defs = deps['third_party']
                        for t_def in third_party_defs:
                            if t_def in dependency_dist:
                                dependency_dist[t_def].append(bundle_name)
                            else:
                                dependency_dist[t_def] = [bundle_name]
    print(count)

def getbundname (path_list):
    print (path_list)
    bundle_list = []
    for path in path_list:
        # 读取JSON文件并获取指定key的value
        with open(os.path.join( home, path, "bundle.json"), 'r') as file:
            data = json.load(file)
        bundle_list.append(data['component']['name'])
    return bundle_list

def get_all_dependencies(nodes, dependencies):
    visited = set()  # 存储已访问的节点
    string_buffer = []

    def dfs(node, num, string_buffer):
        string_buffer.append("  " * num + node)  # 追加内容到列表
        if node in visited:
            return
        if DEEP != -1 and num > DEEP:
            return
        visited.add(node)
        if node in dependencies:
            for dependency in dependencies[node]:
                dfs(dependency, num + 1, string_buffer)  # 传递可变对象进行修改

    for node in nodes:
        dfs(node, 0, string_buffer)

    return visited, string_buffer

def write_precise_gni(depends_list,file_name):
    # 将数组转换为字符串形式，例如使用逗号分隔
    array_str = json.dumps(list(depends_list))

    # 打开文件并写入数组字符串
    with open(file_name, 'w') as file:
        file.write("precise_run=")
        file.write(array_str)

def write_file(depends_list,file_name):
    with open(file_name,'w') as f:
        json.dump(depends_list, f, indent=4)


def run(precise_repo_xts_list):
    # pr数>MAX或在白名单中的
    if len(precise_repo_xts_list)>=MAX_PRECISE_PR_NUM or any(item in precise_repo_xts_list for item in whitelist):
        depends_tree = "all"
        depends_list = {"all"}
    else:
        # 计算首层依赖map
        get_f_dependes_dist(home)
        # 首层依赖树打印
        # write_file(dependency_dist, os.path.join(preloader_path,f_depends_name))
        # 获取bundle_name_list
        bundlelist = getbundname(precise_repo_xts_list)
        print(bundlelist)
        # 获取全部需要跑的bundlename
        depends_list, depends_tree = get_all_dependencies(bundlelist,dependency_dist)
        print(depends_list)
    # 依赖树输出
    write_file(depends_tree, os.path.join(preloader_path,depends_tree_name))
    # 写入gni文件
    write_precise_gni(depends_list, os.path.join(preloader_path,precise_gni_name))


if __name__ == '__main__':
    print("counting dependencies start")
    run(precise_repo_xts.split(':'))
    print("counting dependencies finished")