from utils import utils
from utils import file_utils
from utils import log_utils

index = 0


def recordMem(pid, pkgName, filePath):
    cmd = "adb shell dumpsys meminfo %s" % (pid)
    stat = utils.excuteCmd(cmd)
    memArr = stat.splitlines()

    for item in memArr:
        line = item.lstrip()
        if line.startswith("Java Heap:") or line.startswith("Native Heap:") or line.startswith("TOTAL:") or line.startswith("System:") or line.startswith("Code:") or line.startswith("Stack:") or line.startswith("Graphics:") or line.startswith("Private Other:"):
            valueArr = line.split()
            if valueArr[0] == 'Java':
                java = int(valueArr[2])
            elif valueArr[0] == 'Native':
                native = int(valueArr[2])
            elif valueArr[0] == 'TOTAL:':
                total = int(valueArr[1])
            elif valueArr[0] == 'System:':
                sys = int(valueArr[1])
            elif valueArr[0] == 'Code:':
                code = int(valueArr[1])
            elif valueArr[0] == 'Stack:':
                stack = int(valueArr[1])
            elif valueArr[0] == 'Graphics:':
                graphics = int(valueArr[1])
            elif valueArr[0] == 'Private':
                priother = int(valueArr[2])

    log_utils.log(pkgName + ": \t%d/java \t %d/native \t %d/total " %
                  (java, native, total))

    memFile = filePath + pkgName + "_mem.txt"
    content = utils.getTime() + "|" + str(int(java / 1000)) + "|" + str(int(native / 1000)) + "|" + str(
        int(total / 1000)) + "|" + str(int(sys / 1000)) + "|" + str(int(code / 1000)) + "|" + str(int(stack / 1000)) + "|" + str(int(graphics / 1000))+ "|" + str(int(priother / 1000))
    file_utils.writeFileAdd(memFile, content + "\n")


def execute(pkgArr, filePath):
    for pkgName in pkgArr:
        pid = utils.getPid(pkgName)
        if len(pid) == 0:
            log_utils.log("process %s not run" % (pkgName))
        else:
            recordMem(pid, pkgName, filePath)


def tick(pkgArr, filePath):
    global index
    index = index + 1
    if index % 7 == 0:
        execute(pkgArr, filePath)
        index = 0
