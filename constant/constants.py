from utils import utils
import time

PATH_TEMP = utils.getRootPath() + "/tempfile/"
PATH_PID = utils.getRootPath() + "/tempfile/pid/"
PATH_CPU = utils.getRootPath() + "/tempfile/cpu/"
PATH_MEM = utils.getRootPath() + "/tempfile/mem/"
PATH_FD = utils.getRootPath() + "/tempfile/fd/"
PATH_THREAD = utils.getRootPath() + "/tempfile/tread/"
PATH_TASK = utils.getRootPath() + "/tempfile/task/"

PATH_VIEW = utils.getRootPath() + "/view/"

PATH_CHARS = PATH_VIEW + time.strftime("%Y%m%d%H%M%S_", time.localtime()) + "index.html"
