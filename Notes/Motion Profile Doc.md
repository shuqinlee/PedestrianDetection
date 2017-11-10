# Motion Profile Doc

对于motion profile 生成path的matlab代码文档。

## Functions

### `scaleConv = convertImg(rgb, sigma, pth)`

该函数将读入的rgb图片使用Laplace Gaussian Filter转化成灰度图，作为返回值。

Args:

- `rgb`:  读入的数据
- `sigma`: 使用的滤波参数，通常选择想要识别的带子的像素宽度作为该值。
- `pth`: 暂时不用。想要作为滤波后产生的矩阵存储路径文件夹，用于检测合适的`sigma`用。

Return:

灰度图



### `[p, x] = findPath(entry, withMark)`

给定一个出发点entry, 设置模式 withMark, 返回找到的路径数组：p, 维度为 1*帧高度，里面存的值为y方向的值。

Args:

- `entry`: 起点坐标(x, y)
- `withRemark`: 表示记录处理过的数据的方式，为1的时候是指针式，非1时是直接全赋值式。全部赋值为下一个right值



### `ind = findNext(y, x, lzero, withMark)`

给定一个入口初值x, y, 返回下一行找到的y值ind

Args:

- `y` :行号
- `x` : 
- 列号
- `lzero`: 当前值大于0为正，当前值小于0为负
- `withRemark`: 表示记录处理过的数据的方式，为1的时候是指针式，非1时是直接全赋值式。全部赋值为下一个right值

